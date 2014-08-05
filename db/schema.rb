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

ActiveRecord::Schema.define(version: 20140805191309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drafts", force: true do |t|
    t.integer  "draft_position"
    t.integer  "number_of_teams"
    t.integer  "PPTD"
    t.integer  "PPR"
    t.integer  "Number_of_starting_QBs"
    t.integer  "Number_of_starting_HBs"
    t.integer  "Number_of_starting_WRs"
    t.integer  "Number_of_starting_FLEX"
    t.string   "draft_type"
    t.string   "keeper"
    t.string   "ranking_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rounds",                  default: 16
    t.integer  "current_pick",            default: 1
  end

  create_table "picks", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "draft_id"
    t.integer  "draft_position"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "team"
    t.integer  "points_2013"
    t.integer  "bye_week"
    t.integer  "adp"
    t.string   "position"
    t.float    "beer_value"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "master"
  end

  create_table "teams", force: true do |t|
    t.string  "team_name"
    t.integer "draft_position"
    t.integer "draft_id"
    t.boolean "master",         default: false
  end

end
