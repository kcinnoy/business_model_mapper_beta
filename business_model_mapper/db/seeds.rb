

Business.create!([
  {name: "Acme Inc.", user_id: 2, description: "The Worlds number one Widget company. Fulfilling all your widget needs."},
  {name: "Apple", user_id: 4, description: "Description goes here"},
  {name: "MicroSoft", user_id: 11, description: "A fantastic Tech company"},
  {name: "Facebook", user_id: 12, description: "Awesome tech company"},
  {name: "Twitter", user_id: 13, description: "Awesome tech company"},
  {name: "WeWork", user_id: 10, description: "We do office space so small business "}
])
Invoice.create!([
  {invoice_code: "AP14-001", business_id: 5, resource_id: 14},
  {invoice_code: "AC16-001", business_id: 4, resource_id: 16},
  {invoice_code: "AC15-001", business_id: 4, resource_id: 15},
  {invoice_code: "TW17-001", business_id: 8, resource_id: 17},
  {invoice_code: "WE19-001", business_id: 9, resource_id: 19},
  {invoice_code: "WE21-001", business_id: 9, resource_id: 21},
  {invoice_code: "WE22-001", business_id: 9, resource_id: 22}
])
Project.create!([
  {name: "Subscription fees", strategic_goal_id: 16},
  {name: "Customer Research", strategic_goal_id: 14},
  {name: "Requirements", strategic_goal_id: 15},
  {name: "TV campaign", strategic_goal_id: 17},
  {name: "Customer Research 1", strategic_goal_id: 37},
  {name: "Tiered pricing", strategic_goal_id: 16},
  {name: "Customer Research 3", strategic_goal_id: 49},
  {name: "Customer research", strategic_goal_id: 53},
  {name: "Service Creation", strategic_goal_id: 54},
  {name: "Communication Strategy", strategic_goal_id: 56}
])
Resource.create!([
  {name: "Data Analyst", resource_type: "Staff", total_cost_year: "57000.0", qty: 1, project_id: 26, all_resource_cost: "57000.0"},
  {name: "Financial Advisor", resource_type: "Staff", total_cost_year: "110000.0", qty: 2, project_id: 26, all_resource_cost: "220000.0"},
  {name: "Marketer", resource_type: "Staff", total_cost_year: "65000.0", qty: 2, project_id: 33, all_resource_cost: "130000.0"},
  {name: "Data Analyst", resource_type: "Staff", total_cost_year: "52000.0", qty: 1, project_id: 33, all_resource_cost: "52000.0"},
  {name: "Business Analyst", resource_type: "Staff", total_cost_year: "62000.0", qty: 1, project_id: 34, all_resource_cost: "62000.0"},
  {name: "DataIku", resource_type: "Software", total_cost_year: "20000.0", qty: 1, project_id: 34, all_resource_cost: "20000.0"},
  {name: "Copy writer", resource_type: "Staff", total_cost_year: "30000.0", qty: 1, project_id: 35, all_resource_cost: "30000.0"},
  {name: "Video engineer", resource_type: "Staff", total_cost_year: "40000.0", qty: 1, project_id: 35, all_resource_cost: "40000.0"},
  {name: "Marketer", resource_type: "Staff", total_cost_year: "60000.0", qty: 1, project_id: 52, all_resource_cost: "60000.0"},
  {name: "Data Analyst", resource_type: "Staff", total_cost_year: "50000.0", qty: 2, project_id: 52, all_resource_cost: "100000.0"},
  {name: "Pricing Analyst", resource_type: "Staff", total_cost_year: "70000.0", qty: 1, project_id: 53, all_resource_cost: "70000.0"},
  {name: "Data Analyst", resource_type: "Staff", total_cost_year: "50000.0", qty: 2, project_id: 53, all_resource_cost: "100000.0"},
  {name: "Marketer", resource_type: "Staff", total_cost_year: "70000.0", qty: 2, project_id: 54, all_resource_cost: "140000.0"},
  {name: "Data Analyst", resource_type: "Staff", total_cost_year: "50000.0", qty: 1, project_id: 54, all_resource_cost: "50000.0"},
  {name: "Marketer", resource_type: "Staff", total_cost_year: "70000.0", qty: 2, project_id: 55, all_resource_cost: "140000.0"},
  {name: "Data Analyst ", resource_type: "Staff", total_cost_year: "50000.0", qty: 1, project_id: 55, all_resource_cost: "50000.0"},
  {name: "Workspace Expert", resource_type: "Staff", total_cost_year: "60000.0", qty: 1, project_id: 56, all_resource_cost: "60000.0"},
  {name: "Communications Manager", resource_type: "Staff", total_cost_year: "73000.0", qty: 1, project_id: 57, all_resource_cost: "73000.0"}
])
