class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :status, presence: true, inclusion: ["waiting", "accepte", "refuse"]

  def accept_status
    self.status = "accepte"
  end

  def refuse_status
    self.status = "refuse"
  end

end
