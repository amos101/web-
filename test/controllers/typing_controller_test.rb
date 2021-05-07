require 'test_helper'

class TypingControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get typing_top_url
    assert_response :success
  end

end
