class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :author, :class_name => 'User'
end
