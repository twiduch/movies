# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_18_211139) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_movies", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "movie_id"], name: "index_group_movies_on_group_id_and_movie_id", unique: true
    t.index ["group_id"], name: "index_group_movies_on_group_id"
    t.index ["movie_id"], name: "index_group_movies_on_movie_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "poster"
    t.string "plot"
    t.string "imdb_id"
    t.string "movie_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imdb_id"], name: "index_movies_on_imdb_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_movies", "groups"
  add_foreign_key "group_movies", "movies"
  add_foreign_key "groups", "users"
end
