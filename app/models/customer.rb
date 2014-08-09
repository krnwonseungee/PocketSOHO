class Customer < User
  has_many :messages
  has_many :appointments
  has_many :invoices
end
