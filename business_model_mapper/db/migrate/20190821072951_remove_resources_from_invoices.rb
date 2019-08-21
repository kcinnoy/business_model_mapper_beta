class RemoveResourcesFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invoices, :resources, foreign_key: true
    add_reference :invoices, :resource, index: true, foreign_key: true
  end
end
