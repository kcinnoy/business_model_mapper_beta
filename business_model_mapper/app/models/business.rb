class Business < ApplicationRecord
  belongs_to :user

  has_many :strategic_goals
  has_many :resources

  after_save do
    self.strategic_goals.create(
      [
        {
        name: "SG1",
        description: "SG1 description"
        },
        {
        name: "SG2",
        description: "SG2 description"
        },
        {
        name: "SG3",
        description: "SG3 description"
        }
      ]
    )
  end

  # accepts_nested_attributes_for :strategic_goals

end