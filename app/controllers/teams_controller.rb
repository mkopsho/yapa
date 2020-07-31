class TeamsController < ApplicationController
  include PermissionsHelper
  before_action :logged_in?

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    creator = current_user
    @team.users << creator
    if @team.save!
      creator.memberships.last.update(role: "creator")
      redirect_to team_path(@team)
    else
      render :new
    end
  end
  
  def show
    @team = Team.find_by(id: params[:id])
  end

  def edit
    @team = Team.find_by(id: params[:id])
    team_permissions_check
  end

  def update
    @team = Team.find_by(id: params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find_by(id: params[:id])
    if !@team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to team_path(@team)
    else
      @team.destroy
      flash[:notice] = "Team deleted."
      redirect_to "/home"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :user_id)
  end
end
