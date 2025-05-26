class Server < ApplicationRecord
  enum :server_status, [:online, :offline, :warning]
end
