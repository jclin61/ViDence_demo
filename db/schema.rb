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

ActiveRecord::Schema.define(version: 20131029175233) do

  create_table "cameras", force: true do |t|
    t.string   "cam_name"
    t.text     "cam_description"
    t.text     "cam_pictures"
    t.integer  "video_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cameras", ["review_id"], name: "index_cameras_on_review_id"
  add_index "cameras", ["video_id"], name: "index_cameras_on_video_id"

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "association_id"
    t.string   "association_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["association_id", "association_type"], name: "index_comments_on_association_id_and_association_type"

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "tags"
    t.integer  "user_id"
    t.integer  "camera_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["camera_id"], name: "index_reviews_on_camera_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.integer  "user_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "link"
    t.string   "location"
    t.integer  "rating"
    t.text     "tags"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "camera_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["camera_id"], name: "index_videos_on_camera_id"
  add_index "videos", ["category_id"], name: "index_videos_on_category_id"
  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

end
