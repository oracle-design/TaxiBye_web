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

ActiveRecord::Schema.define(version: 20170125192352) do

  create_table "ratings", force: :cascade do |t|
    t.decimal  "score"
    t.text     "message"
    t.integer  "trip_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trip_feeling_id"
    t.index ["trip_id"], name: "index_ratings_on_trip_id"
  end

  create_table "taxis", id: false, force: :cascade do |t|
    t.string   "plate_number",                                         null: false
    t.string   "driver",                               default: ""
    t.decimal  "avg_rating",   precision: 3, scale: 1, default: "0.0"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["plate_number"], name: "index_taxis_on_plate_number", unique: true
  end

  create_table "trip_feelings", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "route"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "taxi_plate_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
