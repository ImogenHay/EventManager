require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do # called before every test (just like in JUnit): sets a property to an event in the database from our fixtures
    @event = events(:one)
    @user = users(:one)
  end

  test 'should not save invalid ticket' do #test which shows that an empty ticket cannot be saved
    ticket = Ticket.new

    ticket.save
    refute ticket.valid? #refute is opposite of assert
  end

  test 'should save valid review' do #test which shows that a valid ticket can be saved
    ticket = Ticket.new

    ticket.event = @event #set the ticket's location to be the fixture referenced during “setup”
    ticket.user = @user
    ticket.first_name = 'Name'
    ticket.last_name = 'Second'
    ticket.age = '2'

    ticket.save
    assert ticket.valid?
  end

  test 'should not save invalid ticket ages' do #A test which shows that invalid ages wont be saved
    ticket1 = Ticket.new
    ticket1.event = @event #set the review's location to be the fixture referenced during “setup”
    ticket1.user = @user
    ticket1.first_name = 'Name'
    ticket1.last_name = 'Second'
    ticket1.age = '-1'
    refute ticket1.valid?

    ticket2 = Ticket.new
    ticket2.event = @event #set the review's location to be the fixture referenced during “setup”
    ticket2.user = @user
    ticket2.first_name = 'Name'
    ticket2.last_name = 'Second'
    ticket2.age = '151'
    refute ticket2.valid?
  end

end
