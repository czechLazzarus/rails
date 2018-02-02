require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testuser)
  end

  test 'should get new' do
    get login_path
    assert_response :success
  end

  test 'login with valid information followed by logout' do
    get login_path
    post login_path, params: { session: { username:  @user.username,
                                          password: '123456' } }
    assert is_logged_in?
    assert_redirected_to '/'
    follow_redirect!
    assert_template 'main/index'
    assert_select 'a[href=?]', logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to login_url
    follow_redirect!
    assert_select 'a[href=?]', logout_path,      count: 0
  end

end
