json.extract! server, :id, :ip_address, :name, :authentication_token, :status, :created_at, :updated_at
json.url server_url(server, format: :json)
