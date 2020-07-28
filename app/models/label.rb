class Label < ApplicationRecord
  belongs_to :list
  belongs_to :task
end
