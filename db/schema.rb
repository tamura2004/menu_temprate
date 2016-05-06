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

ActiveRecord::Schema.define(version: 20160427122819) do

  create_table "item_masters", force: :cascade do |t|
    t.string   "name"
    t.integer  "gp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "item_master_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "items", ["item_master_id"], name: "index_items_on_item_master_id"
  add_index "items", ["pc_id"], name: "index_items_on_pc_id"

  create_table "master_races", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menus", ["menu_id"], name: "index_menus_on_menu_id"

  create_table "pcs", force: :cascade do |t|
    t.string   "name"
    t.integer  "gp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "master_race_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "races", ["master_race_id"], name: "index_races_on_master_race_id"
  add_index "races", ["pc_id"], name: "index_races_on_pc_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "addr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
