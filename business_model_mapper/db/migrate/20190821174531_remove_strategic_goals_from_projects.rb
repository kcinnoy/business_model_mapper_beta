class RemoveStrategicGoalsFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_reference :strategic_goals, :project, foreign_key: true
  end
end
