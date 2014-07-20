# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BusinessOwner.create(first_name: "Janet", email: "janet@sample.com", business_id: 1 )
Customer.create(first_name: "Alex", email: "alex@sample.com", business_id: 1 )
Customer.create(first_name: "Twin", email: "twin@sample.com", business_id: 1 )
Customer.create(first_name: "Bob", email: "bob@sample.com", business_id: 1 )
Business.create(name: "Sample Biz", business_owner_id: 1,  business_id: 1 )
BusinessOwner.first.messages.create( text: "hi", customer_id: 2, business_owner_id: 1, sender_id: 1 business_id: 1 )
BusinessOwner.first.messages.create( text: "hey twin", customer_id: 3, business_owner_id: 1, sender_id: 1, business_id: 1  )
Customer.find(3).messages.create( text: "hey girl!", customer_id: 3, business_owner_id: 1, sender_id: 3, business_id: 1  )
Customer.find(4).messages.create( text: "hey! - bob", customer_id: 4, business_owner_id: 1, sender_id: 4, business_id: 1 )
