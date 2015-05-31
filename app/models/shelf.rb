class Shelf < ActiveRecord::Base
  belongs_to :user

  def to_read?
    name == 'to-read'
  end

  def currently_reading?
    name == 'currently-reading'
  end

  def read?
    name == 'read'
  end
end
