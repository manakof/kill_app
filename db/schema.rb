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

ActiveRecord::Schema.define(version: 20150718064248) do

  create_table "media", force: true do |t|
    t.text     "content",    limit: 255
    t.string   "media_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "media", ["user_id", "created_at"], name: "index_media_on_user_id_and_created_at"

  create_table "medium", force: true do |t|
    t.string   "media_id"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "midia", force: true do |t|
    t.string   "content"
    t.string   "media_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "pass_key"
    t.string   "remember_token"
  end

  add_index "temp_users", ["email"], name: "index_temp_users_on_email", unique: true
  add_index "temp_users", ["remember_token"], name: "index_temp_users_on_remember_token"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "pass_key"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "users_infos", force: true do |t|
    t.string   "introduction"
    t.integer  "user_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
