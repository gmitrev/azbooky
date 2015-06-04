class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shelves
  has_many :relationships, dependent: :destroy
  has_many :books, through: :relationships
  has_many :activities

  has_many :friendships, foreign_key: :friendable_id
  has_many :inverse_friendships, foreign_key: :friend_id

  after_save :create_default_shelves

  has_many :pending_invited, -> { where(:'friendships.pending' => true)  }, :through => :friendships, :source => :friend

  MESSAGES = {
    'to-read'           => 'Book added to your to-read list!',
    'currently-reading' => 'Book marked as currently reading!',
    'read'              => 'Book marked as read! Add your review below.'
  }

  def update_book(book, shelf_name)
    relationship = relationships.find_or_create_by(book: book)
    shelf = shelves.find_by_name(shelf_name)

    message = MESSAGES[shelf_name]

    if relationship.update_column(:shelf_id, shelf.id)
      Activity.create(user: self, object: book, activity_type: shelf_name)

      [true, message]
    else
      [false, relationship.errors.join(". ")]
    end
  end

  def latest_activities(num=20)
    activities.order("created_at DESC").limit(20)
  end

  # Friendship methods
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
    Friendship.crate(friendable: self, friend: user)
  end

  def approve(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil? || invited?(user)
    friendship.update_column(:pending, false)
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

  private

  def create_default_shelves
    %w(to-read currently-reading read favourites).each do |shelf|
      shelves.create(name: shelf, system: true)
    end
  end
end
