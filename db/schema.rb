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

ActiveRecord::Schema.define(version: 20140719191622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.string   "slogan"
    t.string   "image_url"
    t.integer  "business_owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.integer "business_owner_id"
    t.integer "customer_id"
    t.boolean "seen_by_customer",       default: false
    t.boolean "seen_by_business_owner", default: false
    t.integer "business_id"
  end

  create_table "messages", force: true do |t|
    t.text     "text"
    t.integer  "business_owner_id"
    t.integer  "customer_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "email"
    t.string   "image_url"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
  end

end
