# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_17_184807) do

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_code"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "resource_id"
    t.index ["business_id"], name: "index_invoices_on_business_id"
    t.index ["resource_id"], name: "index_invoices_on_resource_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "strategic_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strategic_goal_id"], name: "index_projects_on_strategic_goal_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_type"
    t.decimal "total_cost_year"
    t.integer "qty"
    t.decimal "all_resource_cost"
    t.integer "project_id"
    t.index ["business_id"], name: "index_resources_on_business_id"
    t.index ["project_id"], name: "index_resources_on_project_id"
  end

  create_table "strategic_goals", force: :cascade do |t|
    t.string "name"
    t.integer "business_id"
    t.string "approach"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_strategic_goals_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.string "first_name"
    t.string "last_name"
    t.integer "business_id"
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
