require 'test_helper'

class SubscribeMailerTest < ActionMailer::TestCase
  test 'sending email' do
    @contactsEmail = ContactsEmail.all.first
    # Create the email and store it for further assertions
    #
    email = SubscribeMailer.subscribe_mails(@contactsEmail)
    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['test2@test.cz'], email.from
    assert_equal ['test@test.com'], email.to
    assert_equal 'MyString', email.subject
  end
end
