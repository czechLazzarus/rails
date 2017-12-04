json.extract! user_smtp, :id, :username, :smtp, :port, :protocol, :password, :created_at, :updated_at
json.url user_smtp_url(user_smtp, format: :json)
