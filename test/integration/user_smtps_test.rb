require 'test_helper'

class UserSmtpsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
  end

  test 'invalid user smtp settings' do
    get user_smtps_path
    assert_no_difference 'UserSmtp.count' do
      post user_smtps_path, params: { user_smtp: { username:  '',
                                         smtp:  '',
                                         port: '',
                                         email: '',
                                         protocol: '',
                                         password: '' } }
    end
    assert_template 'user_smtps/new'
  end

  test 'valid user smtp settings' do
    get user_smtps_path
    assert_difference 'UserSmtp.count', 1 do
      post user_smtps_path, params: { user_smtp: { username:  'testwq',
                                                   smtp:  'teswqt',
                                                   port: 123,
                                                   email: 'test@test.czweq',
                                                   protocol: 'tewqst',
                                                   password: 'teewqst', } }
    end
    follow_redirect!
    assert_template 'user_smtps/show'
    assert is_logged_in?

  end
end