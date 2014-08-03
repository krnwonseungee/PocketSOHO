class Customer < User
  has_many :messages
  has_many :appointments
end
