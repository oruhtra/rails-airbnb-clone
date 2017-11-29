class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
