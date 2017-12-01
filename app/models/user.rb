class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, if: :status

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def pending_reviews# return past bookings, accepted without reviews
    pending_reviews = []
    @past_events =self.events.select { |event| event.date < Time.now }
    @past_events.each do |event|
      event.bookings.each { |booking| pending_reviews << booking if booking.status == "accepted" && booking.review.nil? }
    end
    return pending_reviews
  end

end
