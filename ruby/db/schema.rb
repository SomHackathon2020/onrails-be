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

ActiveRecord::Schema.define(version: 2020_02_09_001717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.decimal "xp"
    t.bigint "categories_id"
    t.string "picture"
    t.index ["categories_id"], name: "index_achievements_on_categories_id"
  end

  create_table "achievements_Assignation", force: :cascade do |t|
    t.integer "user_id"
    t.integer "achievement_id"
    t.date "startedate"
  end

  create_table "associations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
  end

  create_table "event_assignations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.date "joindate"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.decimal "capacity"
    t.text "description"
    t.decimal "xp"
    t.bigint "associations_id"
    t.bigint "categories_id"
    t.decimal "lon"
    t.decimal "lat"
    t.string "address"
    t.string "picture"
    t.decimal "price"
    t.date "startdate"
    t.date "enddate"
    t.index ["associations_id"], name: "index_events_on_associations_id"
    t.index ["categories_id"], name: "index_events_on_categories_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "other_user_id"
    t.date "date"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.decimal "xpneeded"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "salt"
    t.string "email"
    t.string "phone"
    t.date "birth"
    t.decimal "actualxp"
    t.text "picture"
    t.bigint "levels_id"
    t.string "token"
    t.index ["levels_id"], name: "index_users_on_levels_id"
  end

  add_foreign_key "achievements", "categories", column: "categories_id"
  add_foreign_key "events", "associations", column: "associations_id"
  add_foreign_key "events", "categories", column: "categories_id"
  add_foreign_key "users", "levels", column: "levels_id"
end
