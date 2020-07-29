class Membership < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  #accepts_nested_attributes_for :team, :user

  def self.user_roles(user, team)
    user.memberships.where(team_id: team.id)
  end
end
