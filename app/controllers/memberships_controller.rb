class MembershipsController < ApplicationController
  include PermissionsHelper
  before_action :logged_in?

  def index
    if @team = Team.find_by(id: params[:team_id])
    else
      @memberships = Membership.all
    end
  end

  def new
    if @team = Team.find_by(id: params[:team_id])
      @membership = Membership.new(team_id: params[:team_id])
      team_permissions_check
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
    team_permissions_check
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
      team_permissions_check
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
