class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :strategic_goal, optional: true
  has_many :resources

  accepts_nested_attributes_for :resources, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  
end