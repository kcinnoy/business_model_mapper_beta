class CreateStrategicGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :strategic_goals do |t|
      t.string :name
      t.belongs_to :business, foreign_key: true
      t.string :approach
      t.string :description

      t.timestamps
    end
  end
end
