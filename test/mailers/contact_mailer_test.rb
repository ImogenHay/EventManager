require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  # test "the truth" do
  #   assert true
  # end

  test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com", "Matthew Casey", "1234567890", @message = "Great Event Manager!")
    assert_equal ['imogen@hay.cx'], mail.to
    assert_equal ['nick@hay.cx'], mail.from
  end

end
