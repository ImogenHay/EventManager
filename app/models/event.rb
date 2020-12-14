class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy #events have many tickets which will be removed if event removed
  validates_associated :tickets #tickets of event must be valid
  belongs_to :location
  validates :name, :location, :date, :start, :end, presence: true
  validates :name, length: { maximum: 255, too_long: "can be a maximum of %{count} characters" }
  validate :date_is_possible?


  scope :ordered, -> {order('date asc')} #events ordered by date
  scope :indate, -> {where('date > ?', Time.zone.today - 3.days)} #so only display events available events and recent ones

  def date_is_possible? #cant create an event that already happened
    return if date.blank?
    if date < Time.zone.today
      errors.add(:date, 'must be possible (not in the past)')
    end
  end
end
