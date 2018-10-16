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

ActiveRecord::Schema.define(version: 2018_10_15_180849) do

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "full_fills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete"
    t.integer "car_id"
    t.index ["car_id"], name: "index_full_fills_on_car_id"
  end

  create_table "partial_fills", force: :cascade do |t|
    t.integer "full_fill_id"
    t.decimal "price_per_litre", precision: 4, scale: 1
    t.decimal "total_price", precision: 5, scale: 2
    t.decimal "miles_complete", precision: 5, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fully_filled"
    t.index ["full_fill_id"], name: "index_partial_fills_on_full_fill_id"
  end

end
