class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back to Message Me"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem with your login info"
      render 'new'
    end
  end

  def update

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out"
    redirect_to login_path
  end

  def show

  end
end
