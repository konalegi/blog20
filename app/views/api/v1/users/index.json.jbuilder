json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :birthdate, :role, :password_digest
  json.url user_url(user, format: :json)
end
