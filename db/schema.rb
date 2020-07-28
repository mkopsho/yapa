# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_28_145112) do

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.integer "list_id"
    t.integer "task_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_labels_on_list_id"
    t.index ["task_id"], name: "index_labels_on_task_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "summary"
    t.text "description"
    t.string "status", default: "Not started"
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_lists_on_team_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "category"
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "summary"
    t.string "assignee"
    t.boolean "is_complete?", default: false
    t.integer "user_id"
    t.integer "list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "labels", "lists"
  add_foreign_key "labels", "tasks"
  add_foreign_key "lists", "teams"
  add_foreign_key "lists", "users"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "users"
end
