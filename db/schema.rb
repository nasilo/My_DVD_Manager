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

ActiveRecord::Schema.define(version: 20170305165752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dvds", force: :cascade do |t|
    t.string   "title",             null: false
    t.string   "purchase_price"
    t.string   "purchase_location"
    t.integer  "user_rating"
    t.string   "mpaa_rating"
    t.text     "synopsis"
    t.string   "studio"
    t.string   "cast"
    t.string   "writer"
    t.string   "producer"
    t.string   "director"
    t.string   "release_date"
    t.string   "run_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id",           null: false
    t.integer  "upc_id",            null: false
    t.string   "image_small",       null: false
    t.string   "image_large",       null: false
    t.integer  "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",                           null: false
    t.string   "name",                              null: false
    t.text     "url"
    t.boolean  "online",            default: false
    t.boolean  "physical_location", default: false
    t.text     "address"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "upcs", force: :cascade do |t|
    t.string "upc", null: false
  end

  create_table "user_household_members", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.string   "household_member_name", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_user_household_members_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "oauth_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["oauth_uid"], name: "index_users_on_oauth_uid", unique: true, using: :btree
  end

end
