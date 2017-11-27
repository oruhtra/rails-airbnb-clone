class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true

end
