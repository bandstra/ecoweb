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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120528120427) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.integer  "sighting_id"
    t.text     "note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "caption"
    t.text     "description"
    t.integer  "user_id"
    t.string   "file_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "image_id"
    t.string   "gis"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "code"
  end

  create_table "organisms", :force => true do |t|
    t.integer  "image_id"
    t.string   "common_name"
    t.string   "binominal_name"
    t.string   "family"
    t.string   "wikipedia_entry"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "code"
    t.integer  "group_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sightings", :force => true do |t|
    t.integer  "tag"
    t.integer  "organism_id"
    t.float    "length"
    t.float    "weight"
    t.boolean  "parasite"
    t.integer  "location_id"
    t.date     "date"
    t.text     "note"
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "profile"
    t.integer  "image_id"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "code"
    t.string   "avatar"
  end

end
