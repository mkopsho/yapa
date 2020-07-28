class TeamsController < ApplicationController
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
  end

  def update
  end

  def delete
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
