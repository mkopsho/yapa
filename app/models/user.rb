class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships

  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |user|
      user.email = auth[:info][:email]
      user.password = SecureRandom.hex
    end
  end

  def roles(user)
    map = user.memberships.map { |m| m.role }
    map.join(", ")
  end
end
