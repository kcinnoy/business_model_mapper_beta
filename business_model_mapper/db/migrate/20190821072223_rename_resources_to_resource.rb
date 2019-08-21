class RenameResourcesToResource < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :resources
  end
end
