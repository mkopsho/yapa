class UsersController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      render :home
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:error] = "That username is already taken, please try again."
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to '/' if !@user # helper!
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
