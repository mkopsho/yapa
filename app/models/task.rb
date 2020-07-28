class Task < ApplicationRecord
  belongs_to :list

  accepts_nested_attributes_for :list
  validates_presence_of :summary
end
