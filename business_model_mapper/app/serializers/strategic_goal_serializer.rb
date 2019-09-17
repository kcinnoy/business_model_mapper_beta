class StrategicGoalSerializer < ActiveModel::Serializer
  attributes :id , :name, :description, :projects

  def projects
    ActiveModel::SerializableResource.new(object.projects,  each_serializer: ProjectSerializer)
  end
end
