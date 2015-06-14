class Shelf < ActiveRecord::Base
  belongs_to :user

  has_many :relationships

  def to_read?
    name == 'to-read'
  end

  def currently_reading?
    name == 'currently-reading'
  end

  def read?
    name == 'read'
  end

  def self.currently_reading(user)
    find_by(name: 'currently-reading', user: user)
  end
end
