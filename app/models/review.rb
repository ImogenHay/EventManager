class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user
  validates :rating, :location, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  scope :user_reviews, ->(user) { where(['user_id = ?', user.id]) } #Find all notes where the user_id is the same as the passed in user object’s id
end
