class SessionsController < ApplicationController
  def welcome
  end

  def new
  end

  def create
    if params[:provider] == "google_oauth2"
      user = User.create_by_google_omniauth(auth)
      session[:user_id] = user.id
      redirect_to home_path
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path
      else
        flash[:error] = "Invalid credentials, please try again."
        redirect_to login_path
      end
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

  private

  def auth
    request.env["omniauth.auth"]
  end
end