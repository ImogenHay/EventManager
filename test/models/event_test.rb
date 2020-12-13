require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do # called before every test (just like in JUnit): sets a property to a location in the database from our fixtures
    @location = locations(:one)
  end

  test 'should not save empty event' do #test which shows that an empty event cannot be saved
    event = Event.new

    event.save
    refute event.valid? #refute is opposite of assert
  end

  test 'should save valid event' do #test which shows that a valid event can be saved
    event = Event.new

    event.name = 'Name'
    event.location = @location #set the event's location to be the fixture referenced during “setup”
    event.date = Time.zone.today
    event.start = '2020-11-23 17:37:35'
    event.end = '2020-11-23 17:37:35'

    event.save
    assert event.valid?
  end


end
