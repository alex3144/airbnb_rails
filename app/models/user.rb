class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #as renter
  has_many :rented_bikes, through: :bookings, source: :bike
  has_many :bookings
  #as owner
  has_many :requests , through: :bikes , source: :bookings
  has_many :bikes
  has_attachment :photo, maximum:1
end
