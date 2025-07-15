class Server < ApplicationRecord
  has_many :server_logs, dependent: :destroy

  enum :server_status, [:online, :offline, :warning]

  def status_style
    style = {
      online: 'bg-green-100 text-green-700',
      offline: 'bg-red-100 text-red-700',
      warning: 'bg-yellow-100 text-yellow-700'
    }
    style[server_status.to_sym]
  end

  # TODO: must show progress bars colors
  # < 50% : bg-green-500
  # 50% =< 70% : bg-yellow-500
  # 71% =< 80 : bg-orange-500
  # > 81% : bg-red-500

  def ask_for_status
    data = MonitorService.new(self).check_server
    if data.success?
      ServerLog.register(data, id)
      update(server_status: :online)
    else
      update(server_status: :offline)
    end
  end
end
