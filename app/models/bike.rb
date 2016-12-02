class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 3
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

end
