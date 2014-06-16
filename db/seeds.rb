# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BusinessOwner.create(first_name: "Janet", email: "janet@sample.com")
Customer.create(first_name: "Alex", email: "alex@sample.com")
Business.create(name: "Sample Biz")

