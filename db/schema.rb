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

ActiveRecord::Schema.define(version: 20160519133942) do

  create_table "communes", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "inhabitants"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string   "liveability_score_2008"
    t.string   "liveability_score_2002"
    t.string   "liveability_score_2012"
    t.string   "liveability_score_2014"
    t.string   "houses_score_2012"
    t.string   "inhabitants_score_2012"
    t.string   "services_score_2012"
    t.string   "safety_score_2012"
    t.string   "fysical_environment_score_2012"
    t.string   "houses_score_2014"
    t.string   "inhabitants_score_2014"
    t.string   "services_score_2014"
    t.string   "safety_score_2014"
    t.string   "fysical_environment_score_2014"
    t.integer  "commune_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
  end

  add_index "neighbourhoods", ["commune_id"], name: "index_neighbourhoods_on_commune_id"

end
