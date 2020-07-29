class MembershipsController < ApplicationController
  def new
    if @team = Team.find_by(id: params[:team_id])
      @membership = Membership.new(team_id: params[:team_id])
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
  end

  def update
  end

  def delete
  end

  private

  def membership_params
    params.require(:membership).permit(:role, :team_id, :user_id)
  end
end
