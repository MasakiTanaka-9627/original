require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "ホーム" do
    get root_url
    assert_response :success
  end

  test "ヘルプ" do
    get help_url
    assert_response :success
  end
end 
