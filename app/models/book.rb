class Book < ActiveRecord::Base
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships

  attr_accessor :author_id

  def author
    authors.first
  end

  before_save do
    authors << Author.find(author_id) rescue true
  end
end
