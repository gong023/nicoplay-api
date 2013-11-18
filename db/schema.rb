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

ActiveRecord::Schema.define(version: 20131118171927) do

  create_table "histories", force: true do |t|
    t.string   "video_id",   null: false
    t.string   "title",      null: false
    t.integer  "state",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["created_at", "state"], name: "index_histories_on_created_at_and_state", using: :btree
  add_index "histories", ["video_id"], name: "index_histories_on_video_id", unique: true, using: :btree

end
