class Api::MonitoringController < ApplicationController
  before_action :authenticate_token!

  def metrics
    # Cpu usage
    output = `top -bn1 | grep "Cpu(s)"`
    match = output.match(/(\d+\.\d+)\s*id/)  # porcentaje de CPU inactiva (idle)

    if match
      idle = match[1].to_f
      cpu_usage = 100 - idle
    end

    # memory usage
    output = `free -m | grep Mem`
    total, used = output.split[1].to_f, output.split[2].to_f

    mem_usage = (used / total) * 100

    render json: {
      status: 'ok',
      time: Time.now,
      cpu: cpu_usage.round(2),
      memory: mem_usage.round(2),
      uptime: `uptime`,
    }
  end

  private

  def authenticate_token!
    token = request.headers['Authorization']
    head :unauthorized unless token == "Bearer #{ENV['MONITOR_TOKEN']}"
  end
end
