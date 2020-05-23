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

ActiveRecord::Schema.define(version: 2020_05_23_183126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "team_one"
    t.integer "team_two"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "played_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "games_played"
    t.integer "games_started"
    t.integer "minutes"
    t.integer "fg"
    t.integer "fga"
    t.float "fgp"
    t.integer "three_point_gpg"
    t.integer "three_point_attempts"
    t.float "three_point_percentage"
    t.integer "two_point_gpg"
    t.integer "two_point_attempts"
    t.float "two_point_percentage"
    t.float "efg"
    t.integer "ft"
    t.integer "fta"
    t.float "ft_percentage"
    t.integer "orb"
    t.integer "drb"
    t.integer "trb"
    t.integer "ast"
    t.integer "steals"
    t.integer "blocks"
    t.integer "turnovers"
    t.integer "fouls"
    t.integer "ppg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_players", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
