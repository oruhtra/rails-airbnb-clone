class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_one :review, dependent: :destroy
  has_many :messages, dependent: :destroy
end
