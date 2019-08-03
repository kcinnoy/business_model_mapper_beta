class AddColumnsToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :type, :string
    add_column :resources, :total_cost_year, :decimal
  end
end
