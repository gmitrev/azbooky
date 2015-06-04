class Friendship < ActiveRecord::Base
  belongs_to :friendable, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
