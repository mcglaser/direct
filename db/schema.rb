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

ActiveRecord::Schema.define(version: 20170627212907) do

  create_table "districts", force: :cascade do |t|
    t.string   "district_name"
    t.string   "senator_one_name"
    t.string   "senator_one_party"
    t.string   "senator_one_photo_url"
    t.string   "senator_one_website"
    t.string   "senator_one_facebook"
    t.string   "senator_one_twitter"
    t.string   "senator_two_name"
    t.string   "senator_two_party"
    t.string   "senator_two_photo_url"
    t.string   "senator_two_website"
    t.string   "senator_two_facebook"
    t.string   "senator_two_twitter"
    t.string   "us_rep_name"
    t.string   "us_rep_party"
    t.string   "us_rep_photo_url"
    t.string   "us_rep_website"
    t.string   "us_rep_facebook"
    t.string   "us_rep_twitter"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
