require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログイン" do
    get login_url
    assert_response :success
  end

end
