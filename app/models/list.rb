class List < ApplicationRecord
  belongs_to :user, optional: true # So that tasks can be created with a new list. Probably warrants a refactor.
  belongs_to :team, optional: true 
  has_many :tasks
  has_many :users, through: :tasks

  accepts_nested_attributes_for :tasks
  validates_presence_of :summary
end
