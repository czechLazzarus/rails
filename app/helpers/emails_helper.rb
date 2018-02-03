module EmailsHelper
  def send_email_package
    contacts_email = ContactsEmail.where(:sended => false).last(2)
    contacts_email.each do |item|
      user_smtp_id = User.find(item.user_id).user_smtp_id
      contact = Contact.find(item.contact_id)
      email = Email.find(item.email_id)
      configure_mailer(user_smtp_id)
      fill_email(email, contact)
    end
  end

  private

  def configure_mailer(user_smtp_id)
    user_smtp = UserSmtp.find(user_smtp_id)
    Mail.defaults do
      delivery_method :smtp, address: user_smtp.smtp,
                       port: user_smtp.port,
                       user_name: user_smtp.username,
                       password: user_smtp.password,
                       enable_ssl: true
    end
  end

  def fill_email(email, contact)
    Mail.deliver do
      to      contact.email
      from    email.sender
      subject email.subject

      text_part do
        body email.plain_text
      end

      html_part do
        content_type 'text/html; charset=UTF-8'
        body email.text
      end
    end
  end
end
