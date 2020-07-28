class Team < ApplicationRecord
  has_many :lists
  has_many :memberships
  has_many :users, through: :memberships
end
