class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def bookingcheck(user)
    if user.bookings.where(bike_id: @bike.id).empty?
      return true
    else
      return false
    end
  end

  def current_user_photo
    if curent_user.photo?
      return cl_image_tag current_user.photo.path
    else
      return image_tag "http://placehold.it/30x30"
    end
  end
end
