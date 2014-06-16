class Thread < ActiveRecord::Base
  has_one :customer
  has_one :business_owner
  has_many :messages
end
