class BikesController < ApplicationController
  # before_action :find_booking, only: [:index]

  def index
    @bikes = Bike.where(:available == true)
  end

  def show
  end

  private

  # def find_booking
  #   @booking = Booking.find(params[:start_date, :end_date])
  # end
end
