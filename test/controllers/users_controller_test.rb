require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "サインアップ" do
    get signup_url
    assert_response :success
  end
end
