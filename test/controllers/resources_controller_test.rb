require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get resources_url
    assert_response :success

    assert_select 'title', 'ImmyEvents'
    assert_select 'h1', 'Resources Page'
    assert_select 'h2', 'Venues'
    assert_select 'h2', 'Current Events'
    assert_select 'h2', 'Your Reviews'
    assert_select 'h2', 'Your Tickets'
  end



end
