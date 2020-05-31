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

ActiveRecord::Schema.define(version: 2020_05_31_112751) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id_id", null: false
    t.integer "user_id_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id_id"], name: "index_comments_on_post_id_id"
    t.index ["user_id_id"], name: "index_comments_on_user_id_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "text"
    t.integer "user_id_id", null: false
    t.integer "category_id_id", null: false
    t.index ["category_id_id"], name: "index_posts_on_category_id_id"
    t.index ["user_id_id"], name: "index_posts_on_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

  add_foreign_key "comments", "post_ids"
  add_foreign_key "comments", "user_ids"
  add_foreign_key "posts", "category_ids"
  add_foreign_key "posts", "user_ids"
end
