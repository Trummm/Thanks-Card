set :environment, :development
set :output, "log/cron_job.log"

every 1.minutes do
  rake "auto_post:example"
end
