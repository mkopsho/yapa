class List < ApplicationRecord
  belongs_to :team
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks
  validates_presence_of :summary

  scope :order_by_title, -> { order('summary asc') }
end
