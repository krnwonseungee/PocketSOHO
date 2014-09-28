class Appointment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business_owner
  belongs_to :business
  belongs_to :invoice
end
