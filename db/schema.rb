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

ActiveRecord::Schema.define(version: 20131102081115) do

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "hiddenname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "w_classes", force: true do |t|
    t.string   "name"
    t.time     "time"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instructor"
    t.integer  "school_id"
  end

  add_index "w_classes", ["school_id", "created_at"], name: "index_w_classes_on_school_id_and_created_at"

end
