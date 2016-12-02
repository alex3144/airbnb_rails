class RequestsController < ApplicationController
#locataire recoit les demande
#l'index doit lister toutes les demande qu'il a recu des utilisateur  et qui corepspondent a son velo
  def index
    user = current_user
    @bookings = user.requests
  end

  def accept
    @booking = current_user.requests.find(params[:id])
    @booking.accept_status
    if @booking.save
      redirect_to requests_path
    else
      render "requests"
    end
  end

  def refuse
    @booking = current_user.requests.find(params[:id])
    @booking.refuse_status
    if @booking.save
      redirect_to requests_path
    else
      render "requests"
    end
  end
end
