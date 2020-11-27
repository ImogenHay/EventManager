class Event < ApplicationRecord
  belongs_to :location
  has_many :tickets, dependent: :destroy
  validates :name, :location, :date, presence: true
end
