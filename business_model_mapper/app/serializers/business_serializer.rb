class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :strategic_goals

  def strategic_goals
    ActiveModel::SerializableResource.new(object.strategic_goals,  each_serializer: StrategicGoalSerializer)
  end

end
