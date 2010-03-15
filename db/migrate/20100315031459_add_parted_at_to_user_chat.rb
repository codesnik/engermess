class AddPartedAtToUserChat < ActiveRecord::Migration
  def self.up
    add_column :user_chats, :parted_at, :datetime
  end

  def self.down
    remove_column :user_chats, :parted_at
  end
end
