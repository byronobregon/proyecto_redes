class AskServersStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Server.all.each do |server|
      server.ask_for_status
    end

    ActionCable.server.broadcast("server_status", {
      message: Server.all,
      timestamp: Time.current.to_s
    })
  end
end
