class List < ApplicationRecord
  belongs_to :team
  has_many :tasks

  accepts_nested_attributes_for :tasks
  validates_presence_of :summary
end
