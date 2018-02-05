class Email < ApplicationRecord
  has_and_belongs_to_many :contacts
  def fill_email_by_template(template, user_id)
    self.text = template.text
    self.subject = template.subject
    self.sender = template.sender
    self.plain_text = ActionView::Base.full_sanitizer.sanitize(template.text)
    self.user_id = user_id
  end
end
