class BusinessOwner < User
  has_many :messages
  has_many :businesses
end
