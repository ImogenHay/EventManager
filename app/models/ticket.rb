class Ticket < ApplicationRecord
  belongs_to :event #ticket has one event
  belongs_to :user #ticket owned by user
  validates :event, :first_name, :last_name, :age, presence: true
  validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150}
  validates :first_name, :last_name, length: { maximum: 255, too_long: "can be a maximum of %{count} characters" }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  scope :user_tickets, ->(user) { where(['user_id = ?', user.id]) } #finds all notes where user_id same as passed in user objects id
  scope :ordered, -> {order('age desc')} #ordered by age
end
