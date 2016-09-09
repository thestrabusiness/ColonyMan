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

ActiveRecord::Schema.define(version: 20160908232954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holding_cages", force: :cascade do |t|
    t.string   "cage_id"
    t.integer  "occupancy"
    t.string   "sex"
    t.date     "dob"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "mating_cage_id"
    t.string   "parents"
    t.string   "strain"
    t.integer  "mouse_rack_id"
    t.integer  "slot_id"
  end

  add_index "holding_cages", ["slot_id", "mouse_rack_id"], name: "index_holding_cages_on_slot_id_and_mouse_rack_id", using: :btree

  create_table "mating_cages", force: :cascade do |t|
    t.string   "cage_id"
    t.date     "mated"
    t.string   "strain1"
    t.string   "strain2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "mouse_rack_id"
    t.integer  "slot_id"
  end

  add_index "mating_cages", ["slot_id", "mouse_rack_id"], name: "index_mating_cages_on_slot_id_and_mouse_rack_id", using: :btree

  create_table "mice", force: :cascade do |t|
    t.date     "dob"
    t.string   "sex"
    t.integer  "number"
    t.string   "genotype"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "holding_cage_id"
    t.integer  "mating_cage_id"
  end

  create_table "mouse_racks", force: :cascade do |t|
    t.integer  "number"
    t.string   "type"
    t.string   "side"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.integer  "position"
    t.boolean  "occupied"
    t.string   "side"
    t.integer  "mouse_rack_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
