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
    membership = Membership.find_by(id: params[:id])
    if membership.update(membership_params)
      redirect_to team_path
    else
      render :edit
    end
  end

  def destroy
    binding.pry
    membership = Membership.find_by(id: params[:id])
    membership.destroy
    flash[:notice] = "User removed from roster."
    redirect_to team_path
  end

  private

  def membership_params
    params.require(:membership).permit(:role, :team_id, :user_id)
  end
end
