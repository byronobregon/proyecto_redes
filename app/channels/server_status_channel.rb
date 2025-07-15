class ServerStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "server_status"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
