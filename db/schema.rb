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

ActiveRecord::Schema.define(version: 20130702180008) do

  create_table "entities", force: true do |t|
    t.integer  "space_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["entity_id", "entity_type"], name: "index_entities_on_entity_id_and_entity_type"
  add_index "entities", ["space_id"], name: "index_entities_on_space_id"

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["item_id", "item_type"], name: "index_items_on_item_id_and_item_type"
  add_index "items", ["room_id"], name: "index_items_on_room_id"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "links", force: true do |t|
    t.integer  "linked_id"
    t.string   "linked_type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["linked_id", "linked_type"], name: "index_links_on_linked_id_and_linked_type"

  create_table "open_graph_tags", force: true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_graph_tags", ["site_id"], name: "index_open_graph_tags_on_site_id"

  create_table "photos", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "followed_id"
    t.string   "followed_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id", "followed_type"], name: "index_relationships_on_followed_id_and_followed_type"
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "rooms", force: true do |t|
    t.integer  "user_id"
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "sites", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "spaces", force: true do |t|
    t.integer  "user_id"
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spaces", ["user_id"], name: "index_spaces_on_user_id"

  create_table "tag_relationships", force: true do |t|
    t.integer  "tag_id"
    t.integer  "tagged_id"
    t.string   "tagged_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_relationships", ["tag_id"], name: "index_tag_relationships_on_tag_id"
  add_index "tag_relationships", ["tagged_id", "tagged_type"], name: "index_tag_relationships_on_tagged_id_and_tagged_type"

  create_table "tags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.integer  "tid",                        limit: 8
    t.text     "tweet"
    t.string   "username"
    t.string   "name"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "type"
    t.string   "vid"
    t.string   "name"
    t.string   "author"
    t.integer  "aid",                        limit: 8
    t.text     "description"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
