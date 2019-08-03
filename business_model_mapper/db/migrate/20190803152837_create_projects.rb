class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :strategic_goal, foreign_key: true
      t.belongs_to :resource, foreign_key: true

      t.timestamps
    end
  end
end
