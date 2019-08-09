class AddProjectsRefToStrategicGoals < ActiveRecord::Migration[5.2]
  def change
    add_reference :strategic_goals, :project, foreign_key: true
  end
end
