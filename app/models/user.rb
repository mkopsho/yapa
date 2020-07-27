class User < ApplicationRecord
  has_many :lists
  has_many :tasks
  has_many :groups
  has_many :teams, through: :groups
end
