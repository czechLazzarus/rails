require 'test_helper'

class UserSmtpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
    @user_smtp = user_smtps(:one)
  end

end
