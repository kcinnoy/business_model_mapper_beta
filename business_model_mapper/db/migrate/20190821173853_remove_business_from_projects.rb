class RemoveBusinessFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :business, foreign_key: true
    remove_reference :projects, :resource, foreign_key: true
  end
end
