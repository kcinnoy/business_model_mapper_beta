class AddResourceCostToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :all_resource_cost, :decimal
  end
end
