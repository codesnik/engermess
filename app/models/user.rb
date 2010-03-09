class User < ActiveRecord::Base
  has_many :user_chats
  has_many :chats, :through => :user_chats
  has_many :messages
end
