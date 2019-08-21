class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :invoice_code
      t.references :resources, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
