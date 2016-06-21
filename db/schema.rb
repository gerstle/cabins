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

ActiveRecord::Schema.define(version: 20160621014823) do

  create_table "accommodation_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "label",       limit: 20,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "accommodations", force: :cascade do |t|
    t.integer  "accommodation_type_id", limit: 4,                            null: false
    t.integer  "building_id",           limit: 4,                            null: false
    t.boolean  "air_conditioning",                                           null: false
    t.boolean  "bathroom",                                                   null: false
    t.string   "description",           limit: 255
    t.boolean  "hold",                                                       null: false
    t.boolean  "kitchen",                                                    null: false
    t.string   "label",                 limit: 40,                           null: false
    t.integer  "occupancy",             limit: 4,                            null: false
    t.decimal  "price",                             precision: 12, scale: 2, null: false
    t.integer  "quantity",              limit: 4,                            null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "building_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "label",       limit: 20,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.integer  "building_type_id", limit: 4,   null: false
    t.string   "description",      limit: 255
    t.string   "image",            limit: 255
    t.string   "label",            limit: 40,  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "planners", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "category",   limit: 40
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.boolean  "sticky",                   default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "accommodation_id",     limit: 4,                          null: false
    t.integer  "processed_by_user_id", limit: 4
    t.integer  "user_id",              limit: 4,                          null: false
    t.datetime "paid_date"
    t.decimal  "price",                          precision: 12, scale: 2, null: false
    t.integer  "quantity",             limit: 4,                          null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.datetime "confirmed_time"
  end

  create_table "tiers", force: :cascade do |t|
    t.string   "label",       limit: 40,  null: false
    t.string   "description", limit: 255, null: false
    t.datetime "available",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 60,                    null: false
    t.string   "email",           limit: 255,                   null: false
    t.boolean  "admin",                         default: false, null: false
    t.text     "notes",           limit: 65535
    t.string   "password_digest", limit: 255
    t.string   "phone",           limit: 16,                    null: false
    t.boolean  "planner_found",                 default: false, null: false
    t.string   "role",            limit: 20,                    null: false
    t.integer  "tier_id",         limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
