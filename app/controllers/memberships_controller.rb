class MembershipsController < ApplicationController
  before_action :logged_in?

  def new
    if @team = Team.find_by(id: params[:team_id])
      if !@team.users.include?(current_user)
        flash[:error] = "You do not have the correct permissions to do that."
        redirect_to team_path(@team)
      else
        @membership = Membership.new(team_id: params[:team_id])
      end
    else
      @membership = Membership.new
    end
  end

  def create
    @membership = Membership.new(membership_params)
    @team = Team.find_by(id: params[:membership][:team_id])
    if @membership.save!
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
    @membership = Membership.find_by(id: params[:id])
    @team = @membership.team
    if !@team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to team_path(@team)
    end
  end

  def update
    membership = Membership.find_by(id: params[:id])
    if membership.update(membership_params)
      @team = membership.team
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    membership = Membership.find_by(id: params[:id])
    @team = membership.team
    if !@team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to team_path(@team)
    else
      membership.destroy
      flash[:notice] = "User removed from roster."
      redirect_to team_path
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:role, :team_id, :user_id)
  end
end
