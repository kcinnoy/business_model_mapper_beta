class RenameTypeToResources < ActiveRecord::Migration[5.2]
  def change
    rename_column :resources, :type, :resource_type
  end
end
