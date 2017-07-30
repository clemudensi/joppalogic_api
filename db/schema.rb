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

ActiveRecord::Schema.define(version: 20170730214545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "area_type"
    t.string   "region"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "couriers", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "phone"
    t.string   "web_url"
    t.string   "description"
    t.boolean  "active"
    t.text     "capabilities", default: [],              array: true
    t.json     "parameters"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.string   "vehicle_type"
    t.float    "dimension_width"
    t.float    "dimension_height"
    t.float    "dimension_depth"
    t.string   "dimension_unit"
    t.string   "parcel_description"
    t.float    "weight_value"
    t.string   "weigh_unit"
    t.string   "category"
    t.string   "sender_name"
    t.string   "sender_phone_number"
    t.string   "sender_email"
    t.string   "sender_address"
    t.string   "receiver_name"
    t.string   "receiver_phone_number"
    t.string   "receiver_email"
    t.string   "receiver_address"
    t.integer  "rate_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "real_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "courier_id"
    t.float    "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.integer  "from_area_id"
    t.integer  "to_area_id"
    t.index ["slug"], name: "index_rates_on_slug", unique: true, using: :btree
  end

  create_table "real_users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "country_code"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "real_user_id"
    t.integer  "role_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["real_user_id"], name: "index_user_roles_on_real_user_id", using: :btree
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.string   "alternate_phone_number"
    t.string   "company_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "country_code"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parcels", "real_users"
  add_foreign_key "rates", "couriers"
  add_foreign_key "user_roles", "real_users"
  add_foreign_key "user_roles", "roles"
end
