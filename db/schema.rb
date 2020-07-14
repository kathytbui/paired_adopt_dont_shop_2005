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

ActiveRecord::Schema.define(version: 20200713210637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "phone_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications_pets", force: :cascade do |t|
    t.bigint "applications_id"
    t.bigint "pet_id"
    t.string "status"
    t.index ["applications_id"], name: "index_applications_pets_on_applications_id"
    t.index ["pet_id"], name: "index_applications_pets_on_pet_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id"
    t.index ["pet_id"], name: "index_favorites_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "approx_age"
    t.string "sex"
    t.bigint "shelter_id"
    t.string "description"
    t.string "adoption_status"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "content"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shelter_id"
    t.index ["shelter_id"], name: "index_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  add_foreign_key "applications_pets", "applications", column: "applications_id"
  add_foreign_key "applications_pets", "pets"
  add_foreign_key "favorites", "pets"
  add_foreign_key "pets", "shelters"
  add_foreign_key "reviews", "shelters"
end
