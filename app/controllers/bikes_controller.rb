class BikesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @electric_search = false
    if params[:city] != ""
      @city_search = params[:city].downcase.capitalize
      @bikes = Bike.where(city: @city_search).order(created_at: :desc)
    else
      @bikes = Bike.all.order(created_at: :desc)
    end

    if params[:electric] == "1"
      @electric_search = true
      @bikes = @bikes.where(electric: @electric_search).order(created_at: :desc)
    end
    if params[:kind] != ""
      @kind_search = params[:kind]
      @bikes = @bikes.where(kind: @kind_search).order(created_at: :desc)
    end
    @bikes = @bikes.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@bikes) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end


  def show
    @user = current_user
    @bike = Bike.find(params[:id])
    @check = bookingcheck(@user)
  end

  private

  def bookingcheck(user)
    if user_signed_in?
      if user.bookings.where(bike_id: @bike.id).empty?
        return true
      else
        return false
      end
    end
  end

  def bike_params
    params.require(:product).permit(:name, :description, photos: [])
  end
end
