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

ActiveRecord::Schema.define(version: 2020_12_07_115841) do

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.integer "location_id", null: false
    t.string "event_type"
    t.date "date", null: false
    t.text "description"
    t.time "start"
    t.time "end"
    t.integer "num_tickets"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "country", null: false
    t.string "street", null: false
    t.string "postcode", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "location_id", null: false
    t.text "description"
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_reviews_on_location_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "event_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

end
