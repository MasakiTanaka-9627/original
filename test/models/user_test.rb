require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "名前のバリデーションチェック" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "emailのバリデーションチェック" do
    @user.email = "     "
    assert_not @user.valid?
  end
end
