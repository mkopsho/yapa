class Team < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, uniqueness: true

  def unique_user_membership
    users.uniq.map { |user| user }
  end
end
