class StrategicGoal < ApplicationRecord
  belongs_to :business

  has_many :projects
  has_many :resources, through: :projects
end
