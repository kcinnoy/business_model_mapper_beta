class StrategicGoal < ApplicationRecord
  # include ::FormValidations

  belongs_to :business, optional: true

  has_many :projects
  has_many :resources, through: :projects

  accepts_nested_attributes_for :projects, allow_destroy: true

  validates_associated :projects

  # private
 
  # def nested_present
  #   errors.add(:projects, 'must have name') if projects.blank?
  #   # errors.add(:options, 'must be unique') if options.map(&:description).uniq.size != options.size
  # end
end
