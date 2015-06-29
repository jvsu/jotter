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

ActiveRecord::Schema.define(version: 20150629224949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_notes", force: true do |t|
    t.integer  "note_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_notes", ["group_id"], name: "index_group_notes_on_group_id", using: :btree
  add_index "group_notes", ["note_id"], name: "index_group_notes_on_note_id", using: :btree
  add_index "group_notes", ["user_id"], name: "index_group_notes_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "start_time"
    t.string   "notes"
    t.string   "url"
    t.integer  "collection_id"
    t.integer  "time_stamp_h"
    t.integer  "time_stamp_m"
    t.integer  "time_stamp_s"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["collection_id"], name: "index_notes_on_collection_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password_digest"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
