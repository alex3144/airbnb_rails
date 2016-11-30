class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photo, maximum: 3
end
