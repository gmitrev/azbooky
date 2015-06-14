module Recommendable
  extend ActiveSupport::Concern

  def similarity_with(user)
    agreements = (self.likes & user.likes).size
    agreements += (self.dislikes & user.dislikes).size

    disagreements = (self.likes & user.dislikes).size
    disagreements += (self.dislikes & user.likes).size

    total = (self.likes.size + self.dislikes.size).to_f
    # total = ((self.likes + self.dislikes) | (user.likes + user.dislikes)).size

    (agreements - disagreements) / total
  end

  # Prediction for the rating of a book. Bounds are [-1,1]
  def prediction_for(book)
    # Each book starts with rating 0
    rating = 0.0

    # Number of users that liked/disliked the book
    rated_by = book.liked_by.size + book.disliked_by.size

    # Sum of similarities of all users who liked it
    liked_rate = book.liked_by.map do |u|
      self.similarity_with(u)
    end.reduce(:+)

    # Sum of similarities of all users who disliked it
    disliked_rate = book.disliked_by.map do |u|
      self.similarity_with(u)
    end.reduce(:+)

    # Final rating
    rating = rating + liked_rate - disliked_rate

    rating / rated_by.to_f
  end

  def recommendations(n)
    user_books = books.pluck(:id)
    pool = Book.where('id NOT IN (?)', user_books)
    pool.sort_by { |b| self.prediction_for(b) }.reverse.take(n)
  end
end
