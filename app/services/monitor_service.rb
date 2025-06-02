class MonitorService
  def initialize(server)
    @url = server.ip_address
    @token = server.authentication_token
  end

  def check_server
    response = HTTParty.get(@url, headers: {
      "Authorization" => "Bearer #{@token}"
    })
    # guardar en base de datos o log
    rescue => e
      Rails.logger.error "Fallo conexión con #{instance[:name]}: #{e.message}"

    response
  end
end