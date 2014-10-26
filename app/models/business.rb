class Business < ActiveRecord::Base
  belongs_to :business_owner
  has_many :appointments
  has_many :invoices
  has_and_belongs_to_many :users, join_table: 'users_businesses'
end
