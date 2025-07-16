# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "admin@admin.com", name: "Admin", password: "admins")
server = Server.create(
  ip_address: "http://web:3000/api/monitoring/metrics",
  name: "Servidor de prueba",
  authentication_token: "49f3041e0fe69e00cdb0d6150f2211ab41a46aca"
)
now = Time.now
10080.times do
  ServerLog.create(
    server_id: server.id,
    time: now,
    cpu_usage: rand(5..10),
    memory_usage: rand(35..40)
  )
  now -= 1.minute
end
