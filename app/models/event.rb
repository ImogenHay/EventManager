class Event < ApplicationRecord
  belongs_to :location
  validates :name, :location, :date, presence: true
end
