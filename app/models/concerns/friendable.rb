module Friendable
  extend ActiveSupport::Concern

  included do
    has_many :friendships, foreign_key: :friendable_id
    has_many :inverse_friendships, foreign_key: :friend_id
  end

  def friends
    approved_friendship         = Friendship.where(friendable_id: id, pending: false).select(:friend_id).to_sql
    approved_inverse_friendship = Friendship.where(friend_id: id, pending: false).select(:friendable_id).to_sql

    User.where("id in (#{approved_friendship}) OR id in (#{approved_inverse_friendship})")
  end

  def friend_with?(user)
    friends.include?(user)
  end

  def invite(user)
    return false if user == self || find_any_friendship_with(user)
    Friendship.create(friendable: self, friend: user)
  end

  def approve(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil? || invited?(user)
    friendship.update_column(:pending, false)
    Activity.create(user: self, object: user, activity_type: "friendship.created")
  end

  def invited?(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil?
    friendship.friend_id == user.id
  end

  def find_any_friendship_with(user)
    friendship = Friendship.where(:friendable_id => self.id, :friend_id => user.id).first
    if friendship.nil?
      friendship = Friendship.where(:friendable_id => user.id, :friend_id => self.id).first
    end
    friendship
  end
end
