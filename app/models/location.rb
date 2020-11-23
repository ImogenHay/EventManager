class Location < ApplicationRecord
  validates :name, :description, :country, :street, :postcode, presence: true
  validates :name, uniqueness: true
end
