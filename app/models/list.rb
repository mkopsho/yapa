class List < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :tasks
  has_many :users, through: :tasks
end
