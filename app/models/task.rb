class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user, optional: true # So that tasks can be created with a new list. Probably warrants a refactor.
  accepts_nested_attributes_for :list
end
