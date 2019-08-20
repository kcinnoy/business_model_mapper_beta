class CreateResourceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_types do |t|
      t.string :name
      t.references :resource, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
