require 'test_helper'

class AuthsControllerTest < ActionController::TestCase

  test "logging in" do
    post :create, :id => users(:one).to_param
    assert_not_nil @controller.send(:current_user)
    assert_redirected_to chats_path
  end

  test "logging out" do
    delete :destroy
    assert !(@controller.send(:current_user))
    assert_redirected_to users_path
  end
end
