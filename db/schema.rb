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

ActiveRecord::Schema.define(:version => 20130807074204) do

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.string   "status"
    t.text     "description"
    t.integer  "assigned_to_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "stories", ["assigned_to_id"], :name => "index_stories_on_assigned_to_id"

  create_table "story_comments", :force => true do |t|
    t.text     "text"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "story_id"
  end

  add_index "story_comments", ["author_id"], :name => "index_story_comments_on_author_id"
  add_index "story_comments", ["story_id"], :name => "index_story_comments_on_story_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

end
