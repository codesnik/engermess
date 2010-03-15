require 'test_helper'

class ChatsHelperTest < ActionView::TestCase
  test "chat_users should show users in correct order" do
    @chat = Chat.create! :subject => 'foobar'
    @chat.users = users(:one), users(:two)

    assert_equal chat_users(@chat), "#{users(:one).name}, #{users(:two).name}"
  end

  test "chat_users should show users in correct order, once again" do
    # just in case fixtures are going in wrong order
    @chat = Chat.create! :subject => 'foobar'
    @chat.users = users(:two), users(:one)

    assert_equal chat_users(@chat), "#{users(:two).name}, #{users(:one).name}"
  end
end
