class AddReadCountToUserChats < ActiveRecord::Migration
  def self.up
    add_column :user_chats, :read_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :user_chats, :read_count
  end
end
