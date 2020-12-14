class Location < ApplicationRecord
  has_many :events, dependent: :destroy #locations have many events which will be removed if location removed
  has_many :reviews, dependent: :destroy #locations have many reviews which will be removed if location removed
  validates_associated :reviews #reviews of location must be valid, not events since might go out of date but not be removed
  validates :name, :country, :street, :postcode, presence: true
  validates :name, uniqueness: true, length: { maximum: 255, too_long: "can be a maximum of %{count} characters" }
  validates :country, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  scope :ordered, -> {order('name asc')} #ordered by name
end
