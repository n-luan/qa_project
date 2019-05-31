class ProfilesController < ApplicationController

  before_action :logged_in_user, :check_access_edit_update, only: [:edit, :update]

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

   def check_access_edit_update
    @user = User.find(params[:id])
    return if current_user? @user
    flash[:danger] = "Access denied for user"
    redirect_to root_path
  end

end
