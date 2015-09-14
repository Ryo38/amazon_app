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

ActiveRecord::Schema.define(version: 20150914091300) do

  create_table "asins", force: :cascade do |t|
    t.integer  "sku_id"
    t.string   "asin"
    t.string   "title"
    t.string   "category"
    t.integer  "ranking"
    t.string   "brand"
    t.string   "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "asins", ["sku_id"], name: "index_asins_on_sku_id"

  create_table "competitors", force: :cascade do |t|
    t.integer  "asin_id"
    t.string   "condition"
    t.float    "lowest_price"
    t.float    "buybox_price"
    t.float    "lowest_fba_price"
    t.boolean  "has_amazon"
    t.integer  "number_of_offers"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "competitors", ["asin_id"], name: "index_competitors_on_asin_id"

  create_table "inventories", force: :cascade do |t|
    t.string   "sku"
    t.string   "asin"
    t.text     "title"
    t.string   "condition"
    t.float    "price"
    t.float    "ceiling"
    t.float    "competitor"
    t.float    "bb"
    t.float    "lowest"
    t.float    "fbalowest"
    t.integer  "stock"
    t.boolean  "has_amazon"
    t.boolean  "alert"
    t.integer  "ranking"
    t.boolean  "fba"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "upc"
    t.string   "category"
    t.string   "image"
  end

  create_table "skus", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sku"
    t.float    "my_price"
    t.float    "ceiling_price"
    t.float    "floor_price"
    t.string   "supplier"
    t.float    "cost"
    t.boolean  "repricing_status"
    t.boolean  "fba_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "skus", ["user_id"], name: "index_skus_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
