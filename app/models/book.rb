class Book < ActiveRecord::Base
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  attr_accessor :author_id

  def author
    authors.first
  end

  before_save do
    authors << Author.find(author_id) rescue true
  end
end
