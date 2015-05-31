class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :shelf

  delegate :to_read?, to: :shelf
  delegate :currently_reading?, to: :shelf
  delegate :read?, to: :shelf
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
end
