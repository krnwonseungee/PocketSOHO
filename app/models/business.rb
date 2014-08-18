class Business < ActiveRecord::Base
  belongs_to :business_owner
  has_many :appointments
  has_many :invoices
  has_many :customers
end
