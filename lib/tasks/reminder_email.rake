namespace :jobs do
  desc "Sends appointment email reminders"
  task :send_appt_reminders => :environment do
    selected_appts = Appointment.where("date = ? ", Date.today + 2.day)
    selected_appts.each do |appt|
      AppointmentMailer.reminder_email(appt).deliver
    end
    puts "Appointment reminder email sent! #{Time.now}"
  end
end
