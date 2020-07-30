class Membership < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  scope :order_by_role, -> { order('role asc') }

  def self.user_roles(user, team)
    user.memberships.where(team_id: team.id)
  end
end
