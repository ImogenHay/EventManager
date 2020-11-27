require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do # called before every test (just like in JUnit): sets a property to a location in the database from our fixtures
    @location = locations(:one)
  end

  test 'should not save invalid review' do #test which shows that an empty review cannot be saved
    review = Review.new

    review.save
    refute review.valid? #refute is opposite of assert
  end

  test 'should save valid review' do #test which shows that a valid review can be saved
    review = Review.new

    review.location = @location #set the review's location to be the fixture referenced during “setup”
    review.rating = '2'

    review.save
    assert review.valid?
  end

  test 'should not save invalid review ratings' do #A test which shows that invalid ratings wont be saved
    review1 = Review.new
    review1.location = @location #set the review's location to be the fixture referenced during “setup”
    review1.rating = '0'
    refute review1.valid?

    review2 = Review.new
    review2.location = @location #set the review's location to be the fixture referenced during “setup”
    review2.rating = '6'
    refute review2.valid?
  end
end
