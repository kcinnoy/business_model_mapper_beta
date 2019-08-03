class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.belongs_to :business, foreign_key: true

      t.timestamps
    end
  end
end
