# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |i|
  User.create(email: Faker::Internet.free_email, password: "12345678")
end

User.all.each do |u|
  num = Random.rand(1..10)

  candidates = (User.all - u.friends - [u]).shuffle.take(num)
  candidates.each do |c|
    Friendship.create(friendable: u, friend: c, pending: false)
  end

  books_num = Random.rand(0..3)

  books = Book.all.shuffle.take(books_num)
  books.each do |book|
    shelf = u.shelves.sample
    feeling = ['liked', 'disliked', 'meh'].sample
    Relationship.create(user: u, book: book, shelf: shelf, feeling: feeling, favourite: (Random.rand > 0.5), review: Faker::Lorem.paragraphs(Random.rand(1..4), true).join("\n"))
  end

end
