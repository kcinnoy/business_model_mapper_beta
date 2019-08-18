class Resource < ApplicationRecord
  validates :name, length: { maximum: 50 }
  # validates :resource_type, inclusion: { in: [ Staff, Hardware, Software, Fixture ] }
  validates :qty, numericality: true

  belongs_to :business, optional: true
  belongs_to :projects, optional: true

  scope :expensive, -> { where("total_cost_year > ?", 50000)}
  scope :project_cost, -> {sum("all_resource_cost")}



  before_save :calc_resource_cost
  before_destroy :destroy_resources

  private 

  def calc_resource_cost
    unless total_cost_year.blank?
      sum_value = total_cost_year * qty
      self.all_resource_cost = sum_value
    end
  end

  def destroy_resources
    self.resources.destroy_all
  end

end
