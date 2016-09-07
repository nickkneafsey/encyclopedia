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

ActiveRecord::Schema.define(version: 20160907070115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "image_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_votes", ["image_id"], name: "index_image_votes_on_image_id", using: :btree
  add_index "image_votes", ["user_id"], name: "index_image_votes_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_url"
    t.integer  "player_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["player_id"], name: "index_images_on_player_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "team"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "first_year"
    t.string   "last_year"
    t.integer  "nba_player_id"
  end

  add_index "players", ["first_name"], name: "index_players_on_first_name", using: :btree
  add_index "players", ["last_name"], name: "index_players_on_last_name", using: :btree
  add_index "players", ["nba_player_id"], name: "index_players_on_nba_player_id", unique: true, using: :btree

  create_table "stats", force: :cascade do |t|
    t.integer  "nba_player_id"
    t.integer  "games_played"
    t.integer  "games_started"
    t.decimal  "minutes"
    t.decimal  "fgm"
    t.decimal  "fga"
    t.decimal  "fg_pct"
    t.decimal  "fg3m"
    t.decimal  "fg3a"
    t.decimal  "fg_3pct"
    t.decimal  "oreb"
    t.decimal  "dreb"
    t.decimal  "reb"
    t.decimal  "ast"
    t.decimal  "steal"
    t.decimal  "blk"
    t.decimal  "tov"
    t.decimal  "pf"
    t.decimal  "pts"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "ftm"
    t.decimal  "fta"
    t.decimal  "ft_pct"
  end

  add_index "stats", ["nba_player_id"], name: "index_stats_on_nba_player_id", unique: true, using: :btree

  create_table "summaries", force: :cascade do |t|
    t.string   "text"
    t.integer  "player_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "summaries", ["player_id"], name: "index_summaries_on_player_id", using: :btree
  add_index "summaries", ["user_id"], name: "index_summaries_on_user_id", using: :btree

  create_table "summary_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "summary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "summary_votes", ["summary_id"], name: "index_summary_votes_on_summary_id", using: :btree
  add_index "summary_votes", ["user_id"], name: "index_summary_votes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "user_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "image_votes", "images"
  add_foreign_key "image_votes", "users"
  add_foreign_key "images", "players"
  add_foreign_key "images", "users"
  add_foreign_key "summaries", "players"
  add_foreign_key "summaries", "users"
  add_foreign_key "summary_votes", "summaries"
  add_foreign_key "summary_votes", "users"
end
