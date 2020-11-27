class Review < ApplicationRecord
  belongs_to :location
  validates :rating, :location, presence: true
end
