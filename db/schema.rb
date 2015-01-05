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

ActiveRecord::Schema.define(version: 20150104171400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "customer_id"
    t.integer  "business_owner_id"
    t.integer  "business_id"
    t.integer  "invoice_id"
    t.decimal  "amount"
    t.text     "notes"
    t.date     "date"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
  end

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "business_owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.string   "zipcode"
  end

  create_table "conversations", force: true do |t|
    t.integer "business_owner_id"
    t.integer "customer_id"
    t.integer "business_id"
    t.boolean "seen_by_customer",       default: false
    t.boolean "seen_by_business_owner", default: false
  end

  create_table "invoices", force: true do |t|
    t.integer  "customer_id"
    t.integer  "business_id"
    t.decimal  "amount"
    t.date     "due_date"
    t.boolean  "paid",         default: false
    t.boolean  "paid_on_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "text"
    t.integer  "business_owner_id"
    t.integer  "customer_id"
    t.integer  "business_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "email"
    t.string   "image_url",              default: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "encrypted_password",     default: "",                                                                                      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter_handle"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
