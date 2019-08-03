class Business < ApplicationRecord
  belongs_to :user

  has_many :strategic_goals
  has_many :resources

  # accepts_nested_attributes_for :strategic_goals

end