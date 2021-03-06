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

ActiveRecord::Schema.define(version: 20151015192354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "share"
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

  create_table "papers", force: true do |t|
    t.string   "name"
    t.string   "thesis"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "papers", ["user_id"], name: "index_papers_on_user_id", using: :btree

  create_table "point_supports", force: true do |t|
    t.integer  "note_id"
    t.integer  "point_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "point_supports", ["note_id"], name: "index_point_supports_on_note_id", using: :btree
  add_index "point_supports", ["point_id"], name: "index_point_supports_on_point_id", using: :btree
  add_index "point_supports", ["user_id"], name: "index_point_supports_on_user_id", using: :btree

  create_table "points", force: true do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.string   "description"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["paper_id"], name: "index_points_on_paper_id", using: :btree
  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "saves", force: true do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saves", ["collection_id"], name: "index_saves_on_collection_id", using: :btree
  add_index "saves", ["user_id"], name: "index_saves_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "tag_name"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["collection_id"], name: "index_tags_on_collection_id", using: :btree

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

  create_table "your_tags", force: true do |t|
    t.string   "tag"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "your_tags", ["user_id"], name: "index_your_tags_on_user_id", using: :btree

end
