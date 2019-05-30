class ProfilesController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Update profile success!"
      redirect_to current_user
    else
      render :edit
    end
  end

  private 

  def profile_params
    params.require(:profile).permit(:avatar, :full_name, :address, :user_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You need to login"
      redirect_to login_url
    end
  end
  
end
