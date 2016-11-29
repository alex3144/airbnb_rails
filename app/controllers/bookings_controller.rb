class BookingsController < ApplicationController

  def index
    @booking = curent_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    bike = Bike.find(booking_params[:bike_id])
    booking = Booking.new(booking_params)
    booking.bike = bike
    if booking.save
      redirect_to bikes_path
    else
      render 'new'
    end
  end

  private

  def booking_params
  params.require(:booking).permit(:start_date, :end_date)
  end

end
