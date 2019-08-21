class DropResourceTypesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :resource_types
  end
end
