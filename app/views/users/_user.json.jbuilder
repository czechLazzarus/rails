json.extract! user, :id, :username, :firstname, :surname, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
