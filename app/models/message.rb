class Message < ActiveRecord::Base
  belongs_to :business_owner
  belongs_to :customer
  belongs_to :business
  belongs_to :conversation

  before_create :assign_thread_id

  def assign_thread_id
    if Message.where("business_owner_id = ? AND customer_id = ?", self.business_owner_id, self.customer_id ).empty?
      new_conversation = Conversation.create( business_owner_id: self.business_owner_id, customer_id: self.customer_id )
      print new_conversation
      self.conversation_id = new_conversation.id
    else
      self.conversation_id = Message.where("business_owner_id = ? AND customer_id = ?", self.business_owner_id, self.customer_id ).first.conversation_id
    end
  end

end
