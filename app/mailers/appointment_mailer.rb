class AppointmentMailer < ActionMailer::Base
  default from: 'noreply@pocketsoho.com'

  def reminder_email(appt)
    @appt = appt
    @user = appt.customer
    @email = 'jinahill89@gmail.com'
    puts "SENDING EMAIL"
    puts @email
    mail(to: @email, subject: 'Reminder for your Appointment')
  end
end
