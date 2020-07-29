class Membership < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  accepts_nested_attributes_for :team, :user

  #def self.roles(user, team)
  #  membership = self.all.find_each { |m| (m.user_id == user.id && m.team_id == team.id) }
  #  membership.roles
  #end

  def self.id(user)
    membership = self.find { |m| m.user_id == user.id }
    membership.id
  end
end
