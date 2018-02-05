require 'base64'

# Subscribe Mailer
module SubscribeMailerHelper
  def configure_mailer(user_smtp)
    { user_name: user_smtp.username,
      password: Base64.decode64(user_smtp.password),
      port: user_smtp.port,
      address: user_smtp.smtp,
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end
end