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
end
