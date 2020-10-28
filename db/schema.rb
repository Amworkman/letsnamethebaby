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

ActiveRecord::Schema.define(version: 2020_10_28_184740) do

  create_table "babies", force: :cascade do |t|
    t.string "gender"
    t.integer "parent_id"
    t.integer "team_id"
    t.index ["parent_id"], name: "index_babies_on_parent_id"
  end

  create_table "baby_names", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.string "gender"
    t.string "meaning"
    t.string "variations"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "roll"
    t.integer "team_id"
    t.index ["team_id"], name: "index_parents_on_team_id"
  end

  create_table "parents_baby_names", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "baby_name_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["baby_name_id"], name: "index_parents_baby_names_on_baby_name_id"
    t.index ["parent_id"], name: "index_parents_baby_names_on_parent_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "teamname"
  end

end
