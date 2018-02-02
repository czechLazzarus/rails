require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(username: 'test123', firstname: 'Jakub', surname: 'Jakub',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'Username should be unique' do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_raises(ActiveRecord::RecordNotUnique) { duplicate_user.save }
  end

  test 'Username should be saved as lower-case' do
    mixed_case_username = 'TeSteer2'
    @user.username = mixed_case_username
    @user.save
    assert_equal mixed_case_username.downcase, @user.reload.username
  end

end
