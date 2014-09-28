class Message < ActiveRecord::Base
  belongs_to :business_owner
  belongs_to :customer
  belongs_to :business
  belongs_to :conversation

  before_create :assign_conversation_attr

  def assign_conversation_attr
    if Message.where("business_owner_id = ? AND customer_id = ?", self.business_owner_id, self.customer_id ).empty?
      self.conversation = Conversation.create( business_owner_id: self.business_owner_id, customer_id: self.customer_id, business_id: self.business_id )
    else
      self.conversation = Message.where("business_owner_id = ? AND customer_id = ?", self.business_owner_id, self.customer_id ).first.conversation
    end
  end

end
