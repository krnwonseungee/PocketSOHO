class WelcomeMailer < ActionMailer::Base
  default from: 'noreply@pocketsoho.com'

  def email_added_customer(customer, password)
    puts "*************************"
    puts "SENDING MAIL"
    @email = customer.email
    @customer_name = customer.first_name
    @business_name = customer.business.name
    @generated_password = password
    mail(to: @email, subject: 'Welcome to PocketSOHO!')
  end
end
