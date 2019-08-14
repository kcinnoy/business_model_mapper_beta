class Project < ApplicationRecord
  belongs_to :strategic_goal, optional: true
  has_many :resources

  accepts_nested_attributes_for :resources, allow_destroy: true,
  :reject_if => proc { |att| att[:name].blank? && attr[:qty].blank? }
end
