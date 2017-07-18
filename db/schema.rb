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

ActiveRecord::Schema.define(version: 20170718114601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "alternate_phone_number"
    t.string   "fax"
    t.string   "email"
    t.string   "company_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.boolean  "validated"
    t.integer  "parcel_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "couriers", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "phone"
    t.string   "web_url"
    t.string   "description"
    t.string   "courier_id"
    t.boolean  "active"
    t.string   "account_id"
    t.text     "capabilities", default: [],              array: true
    t.json     "parameters"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.integer  "quantity"
    t.float    "price"
    t.string   "currency"
    t.float    "weight"
    t.string   "unit"
    t.string   "parcel_number"
    t.integer  "parcel_id"
    t.string   "item_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.string   "box_type"
    t.float    "dimension_width"
    t.float    "dimension_height"
    t.float    "dimension_depth"
    t.string   "dimension_unit"
    t.string   "parcel_description"
    t.float    "weight_value"
    t.string   "weigh_unit"
    t.string   "parcel_number"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.string   "alternate_phone_number"
    t.string   "fax"
    t.string   "company_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.boolean  "validated"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "authy_id"
    t.datetime "last_sign_in_with_authy"
    t.boolean  "authy_enabled",           default: false
    t.string   "country_code"
    t.index ["authy_id"], name: "index_users_on_authy_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "parcels"
end
