require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
    @email_template = email_templates(:one)
    @email = emails(:one)
  end

  test "should get index" do
    get emails_url
    assert_response :success
  end

  test "should get new" do
    get new_email_url
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post emails_url, params: { email: { plain_text: @email.plain_text, sender: @email.sender, subject: @email.subject, text: @email.text, user_id: @email.user_id, email_template_id: @email_template.id } }
    end

    assert_redirected_to email_url(Email.last)
  end

  test "should show email" do
    get email_url(@email)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_url(@email)
    assert_response :success
  end

  test "should update email" do
    patch email_url(@email), params: { email: { plain_text: @email.plain_text, sender: @email.sender, subject: @email.subject, text: @email.text, user_id: @email.user_id, email_template_id: @email_template.id } }
    assert_redirected_to email_url(@email)
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to emails_url
  end
end
