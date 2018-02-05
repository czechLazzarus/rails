require 'test_helper'

class UserSmtpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username: @user.username, password: '123456' } }
    @user_smtp = user_smtps(:one)
  end

  test 'should get index' do
    get user_smtps_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_smtp_url
    assert_response :success
  end

  test 'should create user_smtp' do
    assert_difference('UserSmtp.count') do
      post user_smtps_url, params: { user_smtp: { username: 'test', smtp: 'smtp', port: 856, protocol: 'test', password: 'test', email: 'test@test3.cz'} }
    end

    assert_redirected_to user_smtps_url
  end

  test 'should get edit' do
    get edit_user_smtp_url(@user_smtp)
    assert_response :success
  end

  test 'should update user_smtp' do
    patch user_smtp_url(@user_smtp), params: { user_smtp: { username: @user_smtp.username, smtp: @user_smtp.smtp, port: 856, protocol: @user_smtp.protocol,password: @user_smtp.password } }
    assert_redirected_to user_smtps_url
  end

  test 'should destroy user_smtp' do
    assert_difference('UserSmtp.count', -1) do
      delete user_smtp_url(@user_smtp)
    end

    assert_redirected_to user_smtps_url
  end
end
