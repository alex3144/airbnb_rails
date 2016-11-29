class BikesController < ApplicationController
  # before_action :find_booking, only: [:index]
  skip_before_action :authenticate_user!

  def index
    city = params[:city].downcase.capitalize
    kind = params[:kind].downcase.capitalize
    @bikes = Bike.where(city: city, kind: kind, available: true)
  end

  def show
    @bike = Bike.find(params[:id])
  end

  private

  # def find_booking
  #   @booking = Booking.find(params[:start_date, :end_date])
  # end
end
