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

ActiveRecord::Schema.define(:version => 20100316230328) do

  create_table "chats", :force => true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "messages_count", :default => 0, :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "chat_id"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chat_id"], :name => "index_messages_on_chat_id"

  create_table "user_chats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "parted_at"
    t.integer  "read_count", :default => 0, :null => false
  end

  add_index "user_chats", ["user_id", "chat_id"], :name => "index_user_chats_on_user_id_and_chat_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
