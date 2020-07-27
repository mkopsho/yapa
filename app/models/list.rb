class List < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :team
end
