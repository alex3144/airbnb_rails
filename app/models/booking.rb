class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :status, presence: true, inclusion: ["waiting", "accept", "refuse"]

  def accept_status
    status = "accepted"
  end

  def refuse_status
    status = "refuse"
  end


end
