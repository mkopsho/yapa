class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :tasks
  has_many :lists, through: :tasks

  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username
end
