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

ActiveRecord::Schema.define(version: 20160612180624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "sock_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "sock_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["sock_id"], name: "index_order_items_on_sock_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socks", force: :cascade do |t|
    t.string   "name"
    t.string   "foot"
    t.decimal  "price"
    t.integer  "style_id"
    t.integer  "category_id"
    t.integer  "size_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "retired",                default: false
    t.string   "image_url_file_name"
    t.string   "image_url_content_type"
    t.integer  "image_url_file_size"
    t.datetime "image_url_updated_at"
  end

  add_index "socks", ["category_id"], name: "index_socks_on_category_id", using: :btree
  add_index "socks", ["size_id"], name: "index_socks_on_size_id", using: :btree
  add_index "socks", ["style_id"], name: "index_socks_on_style_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "username"
    t.string  "password_digest"
    t.integer "role"
    t.string  "password_confirmation"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "socks"
  add_foreign_key "orders", "users"
  add_foreign_key "socks", "categories"
  add_foreign_key "socks", "sizes"
  add_foreign_key "socks", "styles"
end
