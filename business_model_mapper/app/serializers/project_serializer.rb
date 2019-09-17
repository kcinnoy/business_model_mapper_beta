class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :resources

  def resources
    ActiveModel::SerializableResource.new(object.resources,  each_serializer: ResourceSerializer)
  end
end
