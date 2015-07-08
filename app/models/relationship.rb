class Relationship < ActiveRecord::Base
  belongs_to :user, inverse_of: :relationships
  belongs_to :book, inverse_of: :relationships
  belongs_to :shelf

  delegate :to_read?, to: :shelf
  delegate :currently_reading?, to: :shelf
  delegate :read?, to: :shelf

  def null?
    false
  end
end

class NullRelationship
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def to_read?
    false
  end

  def read?
    false
  end

  def currently_reading?
    false
  end

  def favourite?
    false
  end

  def null?
    true
  end
end
