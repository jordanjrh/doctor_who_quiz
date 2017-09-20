require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get quiz" do
    get static_quiz_url
    assert_response :success
  end

end
