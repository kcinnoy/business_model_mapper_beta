class AddProjectToResource < ActiveRecord::Migration[5.2]
  def change
    add_reference :resources, :project, foreign_key: true
  end
end
