class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :resource_type, :total_cost_year, :qty 
end
