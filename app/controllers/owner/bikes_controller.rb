class Owner::BikesController < ApplicationController

  def index
    @user = current_user
    @bikes = @user.bikes
  end


  def new
    @bike = Bike.new
  end


  def create
    @bike= Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render "new"
    end
  end

  def show
  end

  def available
    @bike = current_user.bikes.find(params[:id])
    @bike.available = true
    @bike.save
  end

  def not_available
    @bike = current_user.bikes.find(params[:id])
    @bike.available = false
    @bike.save
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :detail, :price, :city, :brand, :electric, :autonomy, :available, photos: [] )
  end


end

