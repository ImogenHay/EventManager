class Review < ApplicationRecord
  belongs_to :location #review has one location
  belongs_to :user #review has one user
  validates :rating, :location, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  scope :ordered, -> {order('rating asc')}  #ordered by rating
  scope :user_reviews, ->(user) { where(['user_id = ?', user.id]) } #Find all notes where the user_id is the same as the passed in user object’s id
end
