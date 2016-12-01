class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bikes= Bike.last(3)
  end
end
