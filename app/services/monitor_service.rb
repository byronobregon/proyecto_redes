class MonitorService
  def initialize(server)
    @url = server.ip_address
    @token = server.authentication_token
  end

  # envía consulta al servidor ERP
  def check_server
    response = HTTParty.get(@url, headers: {
      "Authorization" => "Bearer #{@token}"
    })

    rescue => e
      Rails.logger.error "Fallo conexión: #{e.message}"

    # retorna el resultado obtenido desde el servidor
    response
  end
end
