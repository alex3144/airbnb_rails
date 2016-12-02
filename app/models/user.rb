class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #as renter
  has_many :bookings
  has_many :rented_bikes, through: :bookings, source: :bike

  #as owner
  has_many :bikes
  has_many :requests, through: :bikes, source: :bookings

  has_attachment :photo, maximum:1
end
