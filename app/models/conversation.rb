class Conversation < ActiveRecord::Base
  has_one :customer
  has_one :business_owner
  has_many :messages

  # before_save :assign_default_vals

  # def assign_default_vals
  #   self.opened_by_receiver = false
  # end

end
