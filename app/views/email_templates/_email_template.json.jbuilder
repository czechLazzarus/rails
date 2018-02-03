json.extract! email_template, :id, :subject, :text, :plain_text, :sender, :footer, :user_id, :created_at, :updated_at
json.url email_template_url(email_template, format: :json)
