json.extract! email, :id, :subject, :text, :plain_text, :sender, :footer, :user_id, :created_at, :updated_at
json.url email_url(email, format: :json)
