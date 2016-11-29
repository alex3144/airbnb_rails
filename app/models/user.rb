class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rented_bikes, through: :bookings, source: :bike
  has_many :bookings
  has_many :bikes
  has_attachment :photo, maximum:1
end
