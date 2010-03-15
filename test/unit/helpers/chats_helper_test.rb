require 'test_helper'

class ChatsHelperTest < ActionView::TestCase
  # FIXME uncomment when named routes would be available for helper unit tests

  #test "chat_users should show users in correct order" do
  #  @chat = Chat.create! :subject => 'foobar'
  #  @chat.users = users(:one), users(:two)

  #  assert_equal chat_users(@chat).strip_tags.squish, "#{users(:one).name}, #{users(:two).name}"
  #end

  #test "chat_users should show users in correct order, once again" do
  #  # just in case fixtures are going in wrong order
  #  @chat = Chat.create! :subject => 'foobar'
  #  @chat.users = users(:two), users(:one)

  #  controller.login users(:two)

  #  assert_equal chat_users(@chat).strip_tags.squish, "You, #{users(:one).name}"
  #end

  #test "parted_chat_users should show parted users" do
  #  @chat = Chat.create! :subject => 'foobar'
  #  @chat.users = users(:one), users(:two)
  #  @chat.part_by(users(:two))

  #  assert_equal parted_chat_users(@chat).strip_tags.squish, "#{users(:two).name}"
  #end
end
