# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_21_141833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheat_sheets", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "instruction"
  end

  create_table "master_stitches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stitches", force: :cascade do |t|
    t.integer "total_stitch"
    t.bigint "cheat_sheet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "master_stitch_id", null: false
    t.index ["cheat_sheet_id"], name: "index_stitches_on_cheat_sheet_id"
    t.index ["master_stitch_id"], name: "index_stitches_on_master_stitch_id"
  end

  add_foreign_key "stitches", "cheat_sheets"
  add_foreign_key "stitches", "master_stitches"
end
