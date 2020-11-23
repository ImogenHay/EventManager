class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :name, :description, :country, :street, :postcode, presence: true
  validates :name, uniqueness: true
end
