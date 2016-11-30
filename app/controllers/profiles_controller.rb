class ProfilesController < ApplicationController

  def show
    @user= current_user
    @bikes = @user.bikes #L'interet ici et que le user peut gerer ses bike depuis son profile
  end

  def edit
    @user= current_user
  end

  def update
    @user= current_user
    @user.update(user_params)
    if @user.save
      redirect_to profile_path
    else render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:photo, :first_name, :last_name, :phone_number)
  end
end
