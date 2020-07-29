class Team < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def unique_roster(team)
    team.users.uniq.map { |user| user }
  end
end
