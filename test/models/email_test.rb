require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @email_template = email_templates(:one)
    @email_templates = EmailTemplate.new({ plain_text: @email_template.plain_text, sender: @email_template.sender, subject: @email_template.subject, text: @email_template.text, user_id: @email_template.user_id} )
    @email = emails(:one)
  end

  test "Migrate template to email" do
    @email.fill_email_by_template(@email_template, 1)
    assert_equal( @email.text, @email_templates.text)
    assert_equal( @email.plain_text, @email_templates.plain_text)
    assert_equal( @email.sender, @email_templates.sender)
    assert_equal( @email.subject, @email_templates.subject)
    assert_equal( @email.user_id, 1)
  end
end
