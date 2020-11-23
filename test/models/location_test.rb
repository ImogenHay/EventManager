require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save empty location' do #A test which shows that an empty location cannot be saved
    location = Location.new

    location.save
    refute location.valid? #refute is opposite of assert
  end

  test 'should save valid location' do #A test which shows a non-empty location can be saved
    location = Location.new

    location.name = 'Name'
    location.description = 'Description'
    location.country = 'Country'
    location.street = 'Street'
    location.postcode = 'Postcode'

    location.save
    assert location.valid?
  end

  test 'should not save duplicate location name' do #A test which shows that a location with a duplicate name to an existing location cannot be saved
    location1 = Location.new
    location1.name = 'Name'
    location1.description = 'Description'
    location1.country = 'Country'
    location1.street = 'Street'
    location1.postcode = 'Postcode'
    location1.save
    assert location1.valid?

    location2 = Location.new
    location2.name = 'Name'
    location2.description = 'Description'
    location2.country = 'Country'
    location2.street = 'Street'
    location2.postcode = 'Postcode'
    location2.save
    refute location2.valid?
  end




end
