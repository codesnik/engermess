require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should not create message" do
    assert_difference('Message.count', 0) do
      post :create, :chat_id => chats(:one).to_param, :message => {:body => 'testtest'}
    end
    assert_redirected_to users_path
  end

  test "should create message" do
    login_as(users(:one))
    assert_difference('Message.count', 1) do
      post :create, :chat_id => chats(:one).to_param, :message => {:body => 'testtest'}
    end
    assert_redirected_to chat_path(assigns(:chat))
  end
end
