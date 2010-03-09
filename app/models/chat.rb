class Chat < ActiveRecord::Base
  has_many :user_chats
  has_many :users, :through => :user_chats

  validates_presence_of :subject
end
