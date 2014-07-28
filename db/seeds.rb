# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BusinessOwner.create(first_name: "Janet", last_name: "Yi", email: "janet@sample.com", business_id: 1, city: "Union City", state: "CA", phone: "555-555-1234", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg" )
Customer.create(first_name: "Alex", last_name: "Simpson", email: "alex@sample.com", business_id: 1, city: "Silver Spring", state: "MD", phone: "555-555-1235", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg" )
Customer.create(first_name: "Twin", last_name: "Young", email: "twin@sample.com", business_id: 1, city: "Oakland", state: "CA", phone: "555-555-1236", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg" )
Customer.create(first_name: "Bob", last_name: "Smith", email: "bob@sample.com", business_id: 1, city: "San Francisco", state: "CA", image_url: "http://www.imcslc.ca/imc/includes/themes/imc/images/layout/img_placeholder_avatar.jpg")
Business.create(name: "Sample Biz", business_owner_id: 1, image_url: "http://wiki.tripwireinteractive.com/images/4/47/Placeholder.png", city: "San Francisco", state: "CA", description: "Lorem ipsum dolor sit amet, odio ignota cetero id vim, mea modo vide fabulas ad. His id animal aliquando, et cibo utamur vim. Id etiam dissentias sed, has prompta delicatissimi cu. Id mei probo novum harum, per falli utinam labores ut. Ei sed reque harum." )
BusinessOwner.first.messages.create( text: "hi", customer_id: 2, business_owner_id: 1, sender_id: 1, business_id: 1 )
BusinessOwner.first.messages.create( text: "hey twin", customer_id: 3, business_owner_id: 1, sender_id: 1, business_id: 1  )
Customer.find(3).messages.create( text: "hey girl!", customer_id: 3, business_owner_id: 1, sender_id: 3, business_id: 1  )
Customer.find(4).messages.create( text: "hey! - bob", customer_id: 4, business_owner_id: 1, sender_id: 4, business_id: 1 )
Appointment.create( notes: "first appointment!", customer_id: 3, business_owner_id: 1, business_id: 1, date: Date.today, time: Time.now )
