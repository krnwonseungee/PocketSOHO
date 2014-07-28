class Conversation < ActiveRecord::Base
  has_one :customer
  has_one :business_owner
  has_many :messages

  # before_create :assign_business_id

  # def assign_business_id
  #   self.business_id = self.messages.first.business_id
  # end

end
