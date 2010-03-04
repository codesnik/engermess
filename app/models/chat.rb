class Chat < ActiveRecord::Base
  has_many :user_chats
  has_many :users, :through => :user_chats
end
