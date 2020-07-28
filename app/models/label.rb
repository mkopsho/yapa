class Label < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :task, optional: true
end
