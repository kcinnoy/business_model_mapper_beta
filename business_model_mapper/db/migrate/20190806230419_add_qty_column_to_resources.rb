class AddQtyColumnToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :qty, :integer
  end
end
