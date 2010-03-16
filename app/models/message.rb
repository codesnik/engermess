class Message < ActiveRecord::Base
  belongs_to :chat, :counter_cache => true, :touch => true
  belongs_to :author, :class_name => 'User'
  has_many :user_chats, :through => :chat

  validates_presence_of :body
end
