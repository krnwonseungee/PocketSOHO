class Business < ActiveRecord::Base
  belongs_to :business_owner
  has_many :appointments
end
