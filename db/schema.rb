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

ActiveRecord::Schema.define(version: 2019_04_16_041701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "cod_ibge"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_responses", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.text "description"
    t.integer "event_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_responses_on_event_id"
    t.index ["user_id"], name: "index_event_responses_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.float "lat"
    t.float "lon"
    t.bigint "city_id"
    t.integer "event_type"
    t.json "event_files"
    t.bigint "user_id"
    t.integer "event_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "votes_up"
    t.integer "votes_down"
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.jsonb "actions", default: {}
    t.string "permissible_type"
    t.bigint "permissible_id"
    t.string "recursive_type"
    t.bigint "recursive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permissible_type", "permissible_id"], name: "index_permissions_on_permissible_type_and_permissible_id"
    t.index ["recursive_type", "recursive_id"], name: "index_permissions_on_recursive_type_and_recursive_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "model_type"
    t.integer "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "reputation"
    t.text "address"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "liked"
    t.index ["event_id"], name: "index_votes_on_event_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "event_responses", "events"
  add_foreign_key "event_responses", "users"
  add_foreign_key "events", "cities"
  add_foreign_key "events", "users"
  add_foreign_key "votes", "events"
  add_foreign_key "votes", "users"
end
