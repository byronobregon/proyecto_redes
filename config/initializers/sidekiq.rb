require 'sidekiq'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0' }

  config.on(:startup) do
    schedule = {
      'ask_server_status_job' => {
        'cron' => '* * * * *',
        'class' => 'AskServersStatusJob'
      }
    }

    Sidekiq::Cron::Job.load_from_hash(schedule)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0' }
end
