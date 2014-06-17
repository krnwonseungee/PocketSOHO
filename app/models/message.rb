class Message < ActiveRecord::Base
  belongs_to :business_owner
  belongs_to :customer
  belongs_to :business
  belongs_to :conversation

  attr_accessor :conversation_id, :customer_id, :business_owner_id
  after_create :assign_thread_id

  def assign_thread_id
    puts "!!!#{self.customer_id}"
    puts "!!!#{self.business_owner_id}"
    if !Message.where("business_owner_id = ? AND customer_id = ?", self.business_owner_id, self.customer_id ).exists?
      new_conversation = Conversation.create( customer_id: self.customer_id, business_owner_id: self.business_owner_id )
      conversation_id = new_conversation.id
    end
  end

end
