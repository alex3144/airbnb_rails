class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 3

end
