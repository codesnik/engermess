require 'test_helper'

class ChatsControllerTest < ActionController::TestCase

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
      post :create, :chat => chats(:one).attributes
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
    put :update, :id => chats(:one).to_param, :chat => chats(:one).attributes
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
    assert_difference('Chat.count') do
      post :create, :chat => chats(:one).attributes
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
    put :update, :id => chats(:one).to_param, :chat => chats(:one).attributes
    assert_redirected_to chat_path(assigns(:chat))
  end

  test "should destroy chat" do
    login_as(users(:one))
    assert_difference('Chat.count', -1) do
      delete :destroy, :id => chats(:one).to_param
    end

    assert_redirected_to chats_path
  end
end
