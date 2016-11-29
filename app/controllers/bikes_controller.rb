class BikesController < ApplicationController
  # before_action :find_booking, only: [:index]
  skip_before_action :authenticate_user!

  def index
    city_search = params[:city].downcase.capitalize
    kind_search = params[:kind].downcase.capitalize
    electric_search = false
    if params[:electric] == 1
      electric_search == true
    end
    @bikes = Bike.where(city: city_search, kind: kind_search, available: true, electric: electric_search)
  end

  def show
    @bike = Bike.find(params[:id])
  end

  private

  # def find_booking
  #   @booking = Booking.find(params[:start_date, :end_date])
  # end
end
