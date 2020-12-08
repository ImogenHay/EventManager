class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :event, :first_name, :last_name, :age, presence: true
  validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150}

  scope :user_tickets, ->(user) { where(['user_id = ?', user.id]) } #finds all notes where user_id same as passed in user objects id
end
