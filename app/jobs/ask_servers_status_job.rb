class AskServersStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Server.all.each do |server|
      server.ask_for_status
    end
  end
end
