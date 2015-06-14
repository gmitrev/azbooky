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

ActiveRecord::Schema.define(version: 20150614123742) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "activity_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "nationality"
    t.date     "born"
    t.date     "died"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "isbn"
    t.string   "lang"
    t.integer  "page_count"
    t.integer  "published_in"
    t.string   "published_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "friendable_id"
    t.integer "friend_id"
    t.integer "blocker_id"
    t.boolean "pending",       default: true
  end

  add_index "friendships", ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.string   "feeling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "review"
    t.boolean  "favourite"
  end

  add_index "relationships", ["book_id"], name: "index_relationships_on_book_id"
  add_index "relationships", ["shelf_id"], name: "index_relationships_on_shelf_id"
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "shelves", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shelves", ["user_id"], name: "index_shelves_on_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
