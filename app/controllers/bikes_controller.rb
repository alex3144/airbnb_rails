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
  end

  def show
    @user = current_user
    @bike = Bike.find(params[:id])
    @check = bookingcheck(@user)
  end

  private

  def bike_params
    params.require(:product).permit(:name, :description, photos: [])
  end
end
