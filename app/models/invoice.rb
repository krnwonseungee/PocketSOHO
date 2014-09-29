class Invoice < ActiveRecord::Base
  belongs_to :business
  belongs_to :customer
  has_many :appointments
end
