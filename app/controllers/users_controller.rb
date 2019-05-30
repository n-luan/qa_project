class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.valid? & verify_recaptcha(model: @user)
      @user.build_profile
      @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Update password success!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You need to login"
      redirect_to login_url
    end
  end

  def checkProfile
    @user = User.find(params[:id])
    if @user.profile.present?
      render :show
    else
      flash[:warning] = "Profile not found! Please create new profile"
      redirect_to new_profile_url
    end
  end

end
