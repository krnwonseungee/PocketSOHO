set :output, "#{path}/log/cron.log"

every 1.minute do
  rake "jobs:send_appt_reminders"
end
