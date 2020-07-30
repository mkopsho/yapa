class Task < ApplicationRecord
  belongs_to :list

  accepts_nested_attributes_for :list
  validates_presence_of :summary

  # scope :created_today, -> { where("created_at < ?", Time.zone.now.beginning_of_day) }
end
