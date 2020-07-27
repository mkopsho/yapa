class Team < ApplicationRecord
  has_many :lists
  has_many :groups
  has_many :users, through: :groups
end
