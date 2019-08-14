class Resource < ApplicationRecord
  validates :name, length: { maximum: 50 }

  belongs_to :business, optional: true
  belongs_to :projects, optional: true

  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

  scope :expensive, -> { where("total_cost_year: > ?", 50000)}

end
