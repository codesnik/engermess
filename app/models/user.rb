class User < ActiveRecord::Base
  has_many :user_chats
  has_many :chats, :through => :user_chats,
    :select => "chats.*, (chats.messages_count - user_chats.read_count) as unread_count",
    :conditions => "user_chats.parted_at is null",
    :order => "chats.updated_at desc"
  has_many :messages, :foreign_key => :author_id
end
