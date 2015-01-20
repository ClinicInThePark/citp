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

ActiveRecord::Schema.define(version: 20150120023057) do

  create_table "attendances", force: true do |t|
    t.integer  "event_id"
    t.integer  "booth_id"
    t.integer  "booth_attendance", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "attendances", ["booth_id"], name: "index_attendances_on_booth_id"
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"

  create_table "booths", force: true do |t|
    t.string   "name"
    t.string   "service"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visitor_count", default: 0
  end

  create_table "create_events", force: true do |t|
    t.date     "date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "boothlist"
    t.integer  "total_count", default: 0
  end

  create_table "passports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activation_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
