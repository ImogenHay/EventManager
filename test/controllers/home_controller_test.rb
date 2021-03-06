require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Welcome to ImmyEvents - Event Manager'
    assert_select 'h2', 'Current Events'
    assert_select 'h2', 'Venues'
    assert_select 'h2', 'Accounts'
    assert_select 'h2', 'Accessibility Settings'

  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Contact Us'
    assert_select 'h4', 'Complete the following form to get in touch with us.'
  end

  test "should get about" do
    get about_url
    assert_response :success

    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'About Us'
  end

  test "should post request contact but not valid" do
    post request_contact_url
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_url, params: {name: "Matthew", email: "matthew@me.com", telephone: "1234567890", message: "Hello"}
      assert_response :redirect
      assert_nil flash[:alert]
      assert_not_empty flash[:notice]
end

end
