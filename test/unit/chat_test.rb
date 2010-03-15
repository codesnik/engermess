require 'test_helper'

class ChatTest < ActiveSupport::TestCase

  test "should create chat with valid attributes" do
    assert_nothing_raised do
      Chat.create! :subject => 'foobar'
    end
  end

  test "should require subject" do
    assert_raise ActiveRecord::RecordInvalid do
      Chat.create! :subject => nil
    end
  end

  test "part_by should remove chat from collection" do
    chat = chats(:one)
    user = chat.users.first
    chat.part_by(user)
    assert !user.chats(true).include?(chat)
  end
end
