require 'test_helper'

class UserCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
  end

  test 'invalid user smtp settings' do
    get categories_path
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name:  '' }}
    end
    assert_template 'categories/new'
  end

  test 'valid user smtp settings' do
    get categories_path
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name:  'test' } }
    end
    follow_redirect!
    assert_template 'categories/index'
    assert is_logged_in?

  end
end