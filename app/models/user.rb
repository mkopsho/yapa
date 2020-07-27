class User < ApplicationRecord
  has_many :lists
  has_many :tasks
  has_many :groups
  has_many :teams, through: :groups

  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username
end
