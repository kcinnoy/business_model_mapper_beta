class Business < ApplicationRecord
 
  validates :name, presence: true

  belongs_to :user

  has_many :strategic_goals
  has_many :invoices
  has_many :resources, through: :invoices

  after_create do
    self.strategic_goals.create(
      [
        {
        name: "Customer segments",
        description: "The different groups of people or organisations a business aims to reach and serve"
        },
        {
        name: "Value propositions",
        description: "The bundle of products and services that create value for a specific Customer Segment"
        },
        {
        name: "Revenue streams",
        description: "The cash a company generates from each Customer Segment"
        },
        {
        name: "Channels",
        description: "How a company communicates with and reaches its Customer Segments to deliver a Value Proposition"
        },
      ]
    )
  end

end