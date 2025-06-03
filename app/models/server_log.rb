class ServerLog < ApplicationRecord
  belongs_to :server

  scope :latest_log, -> { order(id: :desc).first }

  def self.register(data, server_id)
    create(
      time: data['time'],
      cpu_usage: data['cpu'],
      memory_usage: data['memory'],
      server_id: server_id
    )
  end
end
