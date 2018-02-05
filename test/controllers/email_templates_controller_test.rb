require 'test_helper'

class EmailTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username: @user.username, password: '123456' } }
    @email_template = email_templates(:one)
  end

  test 'should get index' do
    get email_templates_url
    assert_response :success
  end

  test 'should get new' do
    get new_email_template_url
    assert_response :success
  end

  test 'should create email_template' do
    assert_difference('EmailTemplate.count') do
      post email_templates_url, params: { email_template: { plain_text: @email_template.plain_text, sender: @email_template.sender, subject: @email_template.subject, text: @email_template.text, user_id: @email_template.user_id, email_template_category: ['0', '0'] } }
    end

    assert_redirected_to email_template_url(EmailTemplate.last)
  end

  test 'should get edit' do
    get edit_email_template_url(@email_template)
    assert_response :success
  end

  test 'should update email_template' do
    patch email_template_url(@email_template), params: { email_template: { plain_text: @email_template.plain_text, sender: @email_template.sender, subject: @email_template.subject, text: @email_template.text, user_id: @email_template.user_id, email_template_category: ['0', '0'] } }
    assert_redirected_to email_template_url(@email_template)
  end

  test 'should destroy email_template' do
    assert_difference('EmailTemplate.count', -1) do
      delete email_template_url(@email_template)
    end

    assert_redirected_to email_templates_url
  end
end
