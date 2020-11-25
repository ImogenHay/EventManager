require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
    @location = locations(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url, params: {location_id: @location.id}
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { date: @event.date, description: @event.description, end: @event.end, location_id: @location.id, name: @event.name, price: @event.price, start: @event.start, tickets: @event.tickets, event_type: @event.event_type } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, description: @event.description, end: @event.end, location_id: @location.id, name: @event.name, price: @event.price, start: @event.start, tickets: @event.tickets, event_type: @event.event_type } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
