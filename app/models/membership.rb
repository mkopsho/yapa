class Membership < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  accepts_nested_attributes_for :team, :user

  def self.print_roles(user)
    map = user.memberships.map { |m| m.role }
    map.join(", ")
  end
end
