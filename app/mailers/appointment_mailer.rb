class AppointmentMailer < ActionMailer::Base
  default from: 'noreply@pocketsoho.com'

  def reminder_email(appt)
    # debugger
    @appt = appt
    @user = appt.customer
    @email = appt.customer.email
    puts "SENDING EMAIL"
    puts @email
    puts @appt.date
    mail(to: @email, subject: 'Reminder for your Appointment')
  end
end
