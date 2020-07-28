class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    #team_id
    #user_id
  end

  private

  def membership_params
    params.require(:membership).permit(:category, :team_id, :user_id)
  end
end
