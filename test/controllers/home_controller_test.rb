require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'ImmyEvents'
    assert_select 'h1', 'Welcome to ImmyEvents - Event Manager'
    assert_select 'p', 'Find and Book Events Here!'
  end

end
