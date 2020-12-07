class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :location
  validates :name, :location, :date, presence: true
end
