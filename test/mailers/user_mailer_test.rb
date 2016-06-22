require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = FactoryGirl.create(:user)
  end
  test 'Should check email address' do
    assert_equal UserMailer.send_welcome_email(@user).subject, 'Welcome To New Artist Release'
    assert_equal UserMailer.send_welcome_email(@user).to, [@user.email]
  end
end
