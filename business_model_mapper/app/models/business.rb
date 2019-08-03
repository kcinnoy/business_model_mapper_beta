class Business < ApplicationRecord
  belongs_to :user

  has_many :strategic_goals
  has_man :resources
end
