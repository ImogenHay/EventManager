class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates_associated :reviews
  validates :name, :country, :street, :postcode, presence: true
  validates :name, uniqueness: true, length: { maximum: 255, too_long: "can be a maximum of %{count} characters" }
  validates :country, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  scope :ordered, -> {order('name asc')}
end
