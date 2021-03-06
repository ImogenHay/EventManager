require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers


  setup do #use fixtures to setup values
    @ticket = tickets(:one)
    @event = events(:one)
    @user = users(:one)
    sign_in @user #sign in so pages can be loaded not redircted
  end

  test "should get index" do
    get tickets_url
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Your Tickets'
    assert_select 'h4', 'Table Styles:'
  end

  test "should get new" do
    get new_ticket_url, params: {event_id: @event.id}
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Book Your Ticket'
  end

  test "should create ticket" do #test valid ticket is created
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { age: @ticket.age, event_id: @event.id, first_name: @ticket.first_name, last_name: @ticket.last_name } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
    assert_select 'title', 'ImmyEvents'
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
    assert_select 'title', 'ImmyEvents'  #test basic view content of page loaded
    assert_select 'h1', 'Editing Ticket'
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { age: @ticket.age, event_id: @event.id, first_name: @ticket.first_name, last_name: @ticket.last_name } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end

  test "redirect if signed out" do #test user is redirected to sign in if signed out
    sign_out @user
    get ticket_url(@ticket)
    assert_redirected_to user_session_path, "User is not redirected!"
  end
end
