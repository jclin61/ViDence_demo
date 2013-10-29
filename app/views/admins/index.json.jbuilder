json.array!(@admins) do |admin|
  json.extract! admin, :username, :email, :first_name
  json.url admin_url(admin, format: :json)
end

