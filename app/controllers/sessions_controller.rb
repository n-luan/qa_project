class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash.now[:success] = "Welcome to Ruby on Rails"
      render :new
    else
      flash.now[:danger] = "Account or password not correct"
      render :new
    end
  end
  def destroy
  end	
end
