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

ActiveRecord::Schema.define(version: 20140317152519) do

  create_table "courses", force: true do |t|
    t.string   "day"
    t.integer  "period"
    t.string   "teacher"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "contributor"
    t.string   "content"
    t.string   "post_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_courses", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.integer  "grade"
    t.string   "department"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
