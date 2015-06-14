class Book < ActiveRecord::Base
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships

  attr_accessor :author_id

  def author
    authors.first
  end

  def liked_by
    relationships.includes(:user).where(feeling: 'liked').map(&:user)
  end

  def liked_by_friends_of(user)
    liked_by.select { |u| u.friend_with?(user) }
  end

  def disliked_by
    relationships.includes(:user).where(feeling: 'disliked').map(&:user)
  end

  def disliked_by_friends_of(user)
    disliked_by.reject { |u| u.friend_with?(user) }
  end

  before_save do
    authors << Author.find(author_id) rescue true
  end
end
