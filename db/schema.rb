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

ActiveRecord::Schema.define(version: 2020_03_03_232109) do

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "name"
    t.integer "distance"
    t.integer "time"
    t.string "time_units"
    t.integer "number"
    t.integer "reps"
    t.integer "sets"
    t.integer "weight"
    t.integer "workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

end
