require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save invalid user' do #test which shows that an empty user cannot be saved
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do #test which shows that a valid user can be saved
    user = User.new
    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save
    assert user.valid?
  end

  test "sign up" do #test which shows user can sign up
    user = User.new({
      :email => "bob@example.com",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })

      assert user.save, "User not signed up!"
    end

  test "user edit without password" do #test which shows can't edit user without password
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
