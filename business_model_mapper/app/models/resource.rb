class Resource < ApplicationRecord
  validates :name, length: { maximum: 50 }
  validates :resource_type, inclusion: { in: [ Staff, Hardware, Software, Fixture ] }
  validates :Qty, numericality: true

  belongs_to :business, optional: true
  belongs_to :projects, optional: true

  accepts_nested_attributes_for :projects, allow_destroy: true

  scope :expensive, -> { where("total_cost_year: > ?", 50000)}

end
