class ResourceType < ApplicationRecord
  belongs_to :resource
  belongs_to :project
end
