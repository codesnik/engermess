class AddIndexesToUserChats < ActiveRecord::Migration
  def self.up
    add_index :user_chats, [:user_id, :chat_id]
  end

  def self.down
    remove_index :user_chats, [:user_id, :chat_id]
  end
end
