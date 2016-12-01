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
      respond_to do |format|
        format.html { redirect_to bookings_path }
        format.js
      end
    end
  end

  def refuse
    @booking = current_user.requests.find(params[:id])
    @booking.refuse_status
    @booking.save
     if @booking.save
      respond_to do |format|
        format.html { redirect_to bookings_path }
        format.js
      end
    end
  end
end
