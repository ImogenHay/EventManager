class Ticket < ApplicationRecord
  belongs_to :event
  validates :event, :first_name, :last_name, :age, presence: true
  validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150}
end
