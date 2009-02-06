# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090206203542) do

  create_table "article_list_items", :force => true do |t|
    t.text     "output"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_list_id"
    t.integer  "position"
    t.boolean  "is_link"
    t.string   "url"
  end

  create_table "article_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chronologies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chronology_items", :force => true do |t|
    t.text     "output"
    t.datetime "time_start"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chronology_id"
    t.datetime "time_end"
    t.boolean  "to_present"
  end

  create_table "copy_texts", :force => true do |t|
    t.text     "output"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", :force => true do |t|
    t.text     "output"
    t.integer  "position"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medias", :force => true do |t|
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt_text"
    t.string   "class_name"
    t.string   "credit"
  end

  create_table "page_sections", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.boolean  "has_scroll"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.boolean  "show_title"
    t.integer  "scroll_height"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "site_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "callout"
    t.boolean  "has_scroll"
    t.integer  "scroll_height"
  end

  create_table "quote_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.text     "output"
    t.string   "author"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quote_list_id"
    t.integer  "position"
  end

  create_table "site_sections", :force => true do |t|
    t.string   "name"
    t.boolean  "in_menu"
    t.string   "url"
    t.string   "controller"
    t.string   "action"
    t.boolean  "is_external"
    t.integer  "site_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.datetime "date_filmed"
    t.text     "description"
    t.string   "credit"
    t.integer  "position"
    t.integer  "video_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_photos", :force => true do |t|
    t.integer  "work_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "works", :force => true do |t|
    t.string   "title"
    t.string   "venue"
    t.datetime "date_start"
    t.datetime "date_end"
    t.boolean  "is_ongoing"
    t.text     "description"
    t.integer  "video_id"
    t.integer  "work_thumbnail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "is_early"
  end

end
