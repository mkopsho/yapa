class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save!
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
    @team.destroy
    flash[:notice] = "Team deleted."
    redirect_to tasks_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :user_id)
  end
end
