class SessionsController < ApplicationController
  def welcome
  end

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid credentials, please try again."
      redirect_to login_path
    end
  end

  def clear
    if logged_in?
      session.clear
      redirect_to '/'
    else
      redirect_to '/'
    end
  end
end