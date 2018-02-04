require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
    @category = categories(:one)
  end

end
