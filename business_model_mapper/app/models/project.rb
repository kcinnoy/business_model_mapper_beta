class Project < ApplicationRecord
  belongs_to :strategic_goal, optional: true
  has_many :resources

  accepts_nested_attributes_for :resources
end
