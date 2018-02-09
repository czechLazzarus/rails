require 'test_helper'

class SubscribeMailerHelperTest < ActionView::TestCase
  include SubscribeMailerHelper
  setup do
    @user_smtp = user_smtps(:one)
  end

  test 'should work' do
    result = {user_name: 'MyString',
              password: 'test',
              port: 1,
              address: 'MyString',
              authentication: 'plain',
              enable_starttls_auto: true}

    assert_equal result, configure_mailer(@user_smtp)
  end
end
