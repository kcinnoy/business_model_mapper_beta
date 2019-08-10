class StrategicGoal < ApplicationRecord
  belongs_to :business, optional: true

  has_many :projects
  has_many :resources, through: :projects

  accepts_nested_attributes_for :projects, allow_destroy: true
end
