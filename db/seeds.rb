#business
Business.create(name: "Sample Biz", business_owner_id: 1, image_url: "http://wiki.tripwireinteractive.com/images/4/47/Placeholder.png", city: "San Francisco", state: "CA", description: "Lorem ipsum dolor sit amet, odio ignota cetero id vim, mea modo vide fabulas ad. His id animal aliquando, et cibo utamur vim. Id etiam dissentias sed, has prompta delicatissimi cu. Id mei probo novum harum, per falli utinam labores ut. Ei sed reque harum." )

#business owner
User.create(first_name: "Janet", last_name: "Yi", email: "janet@sample.com", business_id: 1, city: "Union City", state: "CA", phone: "555-555-1234", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "BusinessOwner" )

#customers
User.create(first_name: "Alex", last_name: "Simpson", email: "alex@sample.com", business_id: 1, city: "Silver Spring", state: "MD", phone: "555-555-1235", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "Customer" )
User.create(first_name: "Twin", last_name: "Young", email: "jinahill89@gmail.com", business_id: 1, city: "Oakland", state: "CA", phone: "555-555-1236", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "Customer" )
User.create(first_name: "Bob", last_name: "Smith", email: "bob@sample.com", business_id: 1, city: "San Francisco", state: "CA", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "Customer" )
User.create(first_name: "Tae", last_name: "Yi", email: "tae@sample.com", business_id: 1, city: "San Francisco", state: "CA", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "Customer" )
User.create(first_name: "Hong", last_name: "Yi", email: "hong@sample.com", business_id: 1, city: "San Francisco", state: "CA", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg", password: "password", password_confirmation: "password", type: "Customer" )

#messages
BusinessOwner.first.messages.create( text: "hi", customer_id: 2, business_owner_id: 1, sender_id: 2, business_id: 1 )
BusinessOwner.first.messages.create( text: "hey twin", customer_id: 3, business_owner_id: 1, sender_id: 1, business_id: 1  )
User.find_by_first_name("Twin").messages.create( text: "hey girl!", customer_id: 3, business_owner_id: 1, sender_id: 3, business_id: 1  )
User.find_by_first_name("Bob").messages.create( text: "hey! - bob", customer_id: 4, business_owner_id: 1, sender_id: 4, business_id: 1 )
User.find_by_first_name("Tae").messages.create( text: "hey! - tae", customer_id:"" 5, business_owner_id: 1, sender_id: 5, business_id: 1 )

#appointments
Appointment.create( notes: "first appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: Time.now )
Appointment.create( notes: "2nd appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 1.week) )
Appointment.create( notes: "3rd appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 2.week) )
Appointment.create( notes: "4th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 4.week) )
Appointment.create( notes: "5th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 6.week) )
Appointment.create( notes: "6th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 8.week) )
Appointment.create( notes: "7th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 10.week) )
Appointment.create( notes: "8th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 12.week) )
Appointment.create( notes: "9th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 14.week) )
Appointment.create( notes: "10th appointment!", amount: 50.00, customer_id: 3, business_owner_id: 1, business_id: 1, time: (Time.now + 16.week) )

Appointment.all.each do |appt|
  appt.update( date: appt.time.to_date )
end

#invoices
Invoice.create( customer_id: 2, business_id: 1, amount: 100.00, due_date: Date.today )
Invoice.create( customer_id: 2, business_id: 1, amount: 100.00, due_date: (Date.today + 2.week) )

