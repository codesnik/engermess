class CreateUserChats < ActiveRecord::Migration
  def self.up
    create_table :user_chats do |t|
      t.references :user
      t.references :chat

      t.timestamps
    end
  end

  def self.down
    drop_table :user_chats
  end
end
