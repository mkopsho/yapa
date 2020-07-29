class Team < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
