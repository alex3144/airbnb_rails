class RequestsController < ApplicationController
#locataire recoit les demande
#l'index doit lister toutes les demande qu'il a recu des utilisateur  et qui corepspondent a son velo
  def index
    user = current_user
    @bookings = user.requests
  end

  def accept
    booking = curent_user.requests.find(params[:id])
    booking.accept_status
    booking.save
  end

  def refuse
    booking = curent_user.requests.find(params[:id])
    booking.refuse_status
    booking.save
  end
end
