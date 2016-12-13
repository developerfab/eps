# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161213043012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "additional_information_users", force: :cascade do |t|
    t.integer "user_id"
    t.string  "blood_type",                   null: false
    t.string  "civil_status",                 null: false
    t.string  "occupation"
    t.string  "live_with",       default: [],              array: true
    t.string  "religion"
    t.string  "companion"
    t.string  "place_of_birth"
    t.string  "state"
    t.string  "municipality"
    t.string  "city"
    t.string  "address"
    t.string  "cellphone"
    t.string  "ethnicity"
    t.string  "education_level"
  end

  add_index "additional_information_users", ["user_id"], name: "index_additional_information_users_on_user_id", using: :btree

  create_table "attendants", force: :cascade do |t|
    t.integer "user_id"
    t.string  "document",     null: false
    t.string  "name",         null: false
    t.string  "last_name",    null: false
    t.string  "address"
    t.string  "relationship"
    t.string  "phone",        null: false
  end

  add_index "attendants", ["user_id"], name: "index_attendants_on_user_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "cite_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cites", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "date_cite"
    t.integer  "creator_id"
    t.boolean  "authorized"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.datetime "end_cite"
  end

  add_index "cites", ["service_id"], name: "index_cites_on_service_id", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "speciality"
    t.string   "medical_license"
    t.string   "schedule"
    t.string   "worked_days",     default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "valuation_format"
    t.hstore   "evolution_format"
    t.hstore   "format_not_pos"
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "last_name"
    t.string   "document"
    t.string   "position"
    t.string   "gender"
    t.datetime "birthdate"
    t.string   "phone"
    t.integer  "cite_id"
    t.integer  "doctor_id"
  end

  add_index "users", ["doctor_id"], name: "index_users_on_doctor_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "additional_information_users", "users"
  add_foreign_key "attendants", "users"
  add_foreign_key "histories", "users"
  add_foreign_key "users", "cites"
end
