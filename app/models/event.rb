class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates_associated :tickets
  belongs_to :location
  validates :name, :location, :date, :start, :end, presence: true
  validates :name, length: { maximum: 255, too_long: "can be a maximum of %{count} characters" }
  validate :date_is_possible?

  scope :finished, ->(user) { where(['user_id = ?', user.id]) }
  scope :ordered, -> {order('date asc')}
  scope :indate, -> {where('date > ?', Time.zone.today - 3.days)}

  def date_is_possible?
    return if date.blank?
    if date < Time.zone.today
      errors.add(:date, 'must be possible (not in the past)')
    end
  end
end
