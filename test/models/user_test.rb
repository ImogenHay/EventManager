require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save
    assert user.valid?
  end

  test "sign up" do
    user = User.new({
      :email => "bob@example.com",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })

      assert user.save, "User not signed up!"
    end

  test "user edit without password" do
    user = User.first
    new_data = {
      :email => "bob@example.com",
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:email)
    user.update_without_password(new_data)

    assert_equal user.email, 'bob@example.com', "User is not updated"
  end



end
