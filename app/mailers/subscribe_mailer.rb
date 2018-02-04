require 'base64'

class SubscribeMailer < ApplicationMailer
  include SubscribeMailerHelper

  def subscribe_mails(item)
    @user = User.find(item.user_id)
    user_smtp = UserSmtp.find(@user.user_smtp_id)
    @contact = Contact.find(item.contact_id)
    @email = Email.find(item.email_id)
    unless @email.nil? && @contact.nil? && @email.nil?
      @base_id = Base64.encode64(@contact.id.to_s)
      delivery_options = configure_mailer(user_smtp)
      unless @email.text.nil? && @email.text.empty?
        mail(to: @contact.email,
             from: user_smtp.email,
             delivery_method_options: delivery_options,
             subject: @email.subject) do |format|
          format.html { render 'subscribe_mailer/subscribe' }
          format.text { render 'subscribe_mailer/subscribe' }
        end
      end
    end
  end
end
