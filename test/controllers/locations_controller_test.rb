require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
    assert_select 'title', 'ImmyEvents'
    assert_select 'h1', 'Venues'
    assert_select 'h4', 'Table Styles:'
  end

  test "should get new" do
    get new_location_url
    assert_response :success
    assert_select 'title', 'ImmyEvents'
    assert_select 'h1', 'Adding Venue'
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { country: @location.country, description: @location.description, name: @location.name + " create", postcode: @location.postcode, street: @location.street } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
    assert_select 'title', 'ImmyEvents'
    assert_select 'b', 'Events:'
    assert_select 'b', 'Reviews:'
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
    assert_select 'title', 'ImmyEvents'
    assert_select 'h1', 'Editing Location'
  end

  test "should update location" do
    patch location_url(@location), params: { location: { country: @location.country, description: @location.description, name: @location.name, postcode: @location.postcode, street: @location.street } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
