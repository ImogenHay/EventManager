require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do #use fixtures to setup values
    @review = reviews(:one)
    @location = locations(:one)
    @user = users(:one)
    sign_in @user #sign in so pages can be loaded not redircted
  end

  test "should get index" do
    get reviews_url
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Your Reviews'
    assert_select 'h4', 'Table Styles:'
  end

  test "should get new" do
    get new_review_url, params: {location_id: @location.id}
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Leave Your Review'
  end

  test "should create review" do #test valid review is created
    assert_difference('Review.count') do
      post reviews_url, params: { review: { description: @review.description, location_id: @location.id, rating: @review.rating } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
  end

  test "should get edit" do
    get edit_review_url(@review)
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Editing Review'
  end

  test "should update review" do
    patch review_url(@review), params: { review: { description: @review.description, location_id: @location.id, rating: @review.rating } }
    assert_redirected_to review_url(@review)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete review_url(@review)
    end

    assert_redirected_to reviews_url
  end

  test "redirect if signed out" do #test user is redirected to sign in if signed out
    sign_out @user
    get review_url(@review)
    assert_redirected_to user_session_path, "User is not redirected!"
  end
end
