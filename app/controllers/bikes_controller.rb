class BikesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @electric_search = false

    if params[:city] != ""
      @city_search = params[:city].downcase.capitalize
      @bikes = Bike.where(city: @city_search)
    else
      @bikes = Bike.all
    end
    if params[:electric] == "1"
      @electric_search = true
      @bikes = @bikes.where(electric: @electric_search)
    else
      @bikes = @bikes.all
    end
    if params[:kind] != ""
      @kind_search = params[:kind]
      @bikes = Bike.where(kind: @kind_search)
    else
      @bikes = @bikes.all
    end
  end

  def show
    @bike = Bike.find(params[:id])
  end
end
