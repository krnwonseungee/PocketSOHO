set :output, "#{path}/log/cron.log"

every 12.hour do
  rake "jobs:send_appt_reminders"
end
