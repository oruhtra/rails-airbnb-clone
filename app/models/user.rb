class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, if: :status

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
