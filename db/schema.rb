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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.text    "body"
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "items", force: :cascade do |t|
    t.integer "category_id"
    t.string  "name"
    t.text    "description"
    t.string  "identifier"
    t.string  "owner"
    t.string  "purchase_date"
    t.string  "purchase_price"
    t.string  "storage"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"

  create_table "rentals", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.string  "rental_date"
    t.string  "return_date"
  end

  add_index "rentals", ["item_id"], name: "index_rentals_on_item_id"
  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "playa_name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "phone"
    t.string  "facebook"
    t.text    "description"
    t.boolean "admin",           default: false
  end

end
