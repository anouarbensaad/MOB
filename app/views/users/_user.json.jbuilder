json.extract! user, :id, :login, :nom, :prenom, :email, :utype, :created_at, :updated_at
json.url user_url(user, format: :json)
