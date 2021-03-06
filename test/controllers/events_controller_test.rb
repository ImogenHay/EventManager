require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do #use fixtures to setup values
    @event = events(:one)
    @location = locations(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
    assert_select 'title', 'ImmyEvents' #test basic view content of page loaded
    assert_select 'h1', 'Events'
    assert_select 'h4', 'Table Styles:'
  end

  test "should get new" do
    get new_event_url, params: {location_id: @location.id}
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Creating Event'
  end

  test "should create event" do #test valid event is created
    assert_difference('Event.count') do
      post events_url, params: { event: { date: @event.date, description: @event.description, end: @event.end, location_id: @location.id, name: @event.name, price: @event.price, start: @event.start, num_tickets: @event.num_tickets, event_type: @event.event_type } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'b', 'Your Tickets'
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Editing Event'
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, description: @event.description, end: @event.end, location_id: @location.id, name: @event.name, price: @event.price, start: @event.start, num_tickets: @event.num_tickets, event_type: @event.event_type } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
