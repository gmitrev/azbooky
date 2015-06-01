class User < ActiveRecord::Base

  include Amistad::FriendModel

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shelves
  has_many :relationships, dependent: :destroy
  has_many :books, through: :relationships
  has_many :activities

  after_save :create_default_shelves

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

  private

  def create_default_shelves
    %w(to-read currently-reading read favourites).each do |shelf|
      shelves.create(name: shelf, system: true)
    end
  end
end
