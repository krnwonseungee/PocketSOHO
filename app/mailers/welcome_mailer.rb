class WelcomeMailer < ActionMailer::Base
  default from: 'noreply@pocketsoho.com'

  def email_added_customer(customer, password)
    puts "*************************"
    puts "SENDING MAIL"
    @email = customer.email
    @customer_name = customer.first_name
    @generated_password = password
    mail(to: @email, subject: 'Welcome to PocketSOHO!')
  end
end
