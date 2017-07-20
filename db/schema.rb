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

ActiveRecord::Schema.define(version: 20170715042933) do

  create_table "fellowship_hosts", force: :cascade do |t|
    t.integer  "fellowship_id"
    t.integer  "host_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fellowship_id"], name: "index_fellowship_hosts_on_fellowship_id"
    t.index ["host_id"], name: "index_fellowship_hosts_on_host_id"
  end

  create_table "fellowships", force: :cascade do |t|
    t.string   "name"
    t.boolean  "has_signup_form"
    t.string   "fellowship_type"
    t.string   "location"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lineages", force: :cascade do |t|
    t.string   "name"
    t.integer  "head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["head_id"], name: "index_lineages_on_head_id"
  end

  create_table "pending_fellowship_signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fellowship_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fellowship_id"], name: "index_pending_fellowship_signups_on_fellowship_id"
    t.index ["user_id"], name: "index_pending_fellowship_signups_on_user_id"
  end

  create_table "pending_service_project_signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_project_id"
    t.string   "host_filter"
    t.boolean  "waitlist"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["service_project_id"], name: "index_pending_service_project_signups_on_service_project_id"
    t.index ["user_id"], name: "index_pending_service_project_signups_on_user_id"
  end

  create_table "pledge_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reported_fellowship_signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fellowship_id"
    t.decimal  "points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fellowship_id"], name: "index_reported_fellowship_signups_on_fellowship_id"
    t.index ["user_id"], name: "index_reported_fellowship_signups_on_user_id"
  end

  create_table "reported_service_project_signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_project_id"
    t.decimal  "points"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["service_project_id"], name: "index_reported_service_project_signups_on_service_project_id"
    t.index ["user_id"], name: "index_reported_service_project_signups_on_user_id"
  end

  create_table "service_projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "location"
    t.integer  "host_id"
    t.string   "project_type"
    t.integer  "max_volunteers"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["host_id"], name: "index_service_projects_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "preferred_name"
    t.integer  "pledge_class_id"
    t.integer  "lineage_id"
    t.string   "campus_address"
    t.string   "phone_number"
    t.integer  "graduation_year"
    t.string   "graduation_semester"
    t.string   "school"
    t.string   "major"
    t.string   "minor"
    t.date     "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["lineage_id"], name: "index_users_on_lineage_id"
    t.index ["pledge_class_id"], name: "index_users_on_pledge_class_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
