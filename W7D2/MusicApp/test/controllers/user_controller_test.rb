require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get =" do
    get user_=_url
    assert_response :success
  end

end
