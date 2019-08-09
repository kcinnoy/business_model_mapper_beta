class Resource < ApplicationRecord
  belongs_to :business, optional: true
  belongs_to :projects, optional: true

  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

end
