class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships

  has_secure_password
  validates :username, :email, presence: true
  validates :username, uniqueness: true

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |user|
      user.email = auth[:info][:email]
      user.password = SecureRandom.hex
    end
  end

  def unique_team_membership
    teams.uniq.map { |team| team }
  end
end
