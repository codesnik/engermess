require 'test_helper'

class ChatsControllerTest < ActionController::TestCase

  def valid_chat_attrs
    {
      :chat => {:subject => 'foobar'},
      :message => {:body => 'bodybaz'},
      :recepient_id => users(:two).to_param
    }
  end

  test "should not get index" do
    get :index
    assert_redirected_to users_path
  end

  test "should not get new" do
    get :new
    assert_redirected_to users_path
  end

  test "should not create chat" do
    assert_difference('Chat.count', 0) do
      post :create, valid_chat_attrs
    end
    assert_redirected_to users_path
  end

  test "should not show chat" do
    get :show, :id => chats(:one).to_param
    assert_redirected_to users_path
  end

  test "should not get edit" do
    get :edit, :id => chats(:one).to_param
    assert_redirected_to users_path
  end

  test "should not update chat" do
    put :update, valid_chat_attrs.merge(:id => chats(:one).to_param)
    assert_redirected_to users_path
  end

  test "should not destroy chat" do
    assert_difference('Chat.count', 0) do
      delete :destroy, :id => chats(:one).to_param
    end

    assert_redirected_to users_path
  end



  test "should get index" do
    login_as(users(:one))
    get :index
    assert_response :success
    assert_not_nil assigns(:chats)
  end

  test "should get new" do
    login_as(users(:one))
    get :new
    assert_response :success
  end

  test "should create chat" do
    login_as(users(:one))
    assert_difference('users(:one).chats.count') do
      post :create, valid_chat_attrs
    end

    assert_redirected_to chat_path(assigns(:chat))
  end

  test "should create chat with message" do
    login_as(users(:one))
    assert_difference('Message.count') do
      post :create, valid_chat_attrs
    end

    assert_redirected_to chat_path(assigns(:chat))
  end

  test "should show chat" do
    login_as(users(:one))
    get :show, :id => chats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:one))
    get :edit, :id => chats(:one).to_param
    assert_response :success
  end

  test "should update chat" do
    login_as(users(:one))
    put :update, valid_chat_attrs.merge(:id => chats(:one).to_param)
    assert_redirected_to chat_path(assigns(:chat))
  end

  test "should part chat on destroy" do
    login_as(users(:one))
    assert_difference('Chat.count', 0) do
      assert_difference('users(:one).chats.count', -1) do
        delete :destroy, :id => chats(:one).to_param
      end
    end

    assert_redirected_to chats_path
  end

  test "should show my chats on index" do
    login_as(users(:one))
    get :index
    assert assigns(:chats).include?(chats(:one))
  end

  test "should not show other chats on index" do
    login_as(users(:one))
    get :index
    assert !assigns(:chats).include?(chats(:three))
  end
end
