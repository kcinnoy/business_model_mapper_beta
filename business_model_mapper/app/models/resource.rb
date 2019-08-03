class Resource < ApplicationRecord
  belongs_to :business

  has_many :projects
  has_many :strategic_goals, through: :projects
end
