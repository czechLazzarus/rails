namespace :email do
  desc "will Send 10 emails"
  task send: :environment do
    contacts_email = ContactsEmail.where(sended: false, error: false).last(2)
    contacts_email.each do |item|
      unless item.nil?
        mail = SubscribeMailer.new
        begin
          mail.subscribe_mails(item).deliver
        rescue => e
          item.error = true
          Rails.logger.error e.message
          Rails.logger.error e.backtrace.join("\n")
        else
          item.sended = true
        ensure
          item.save
        end
      end
    end
  end
end
