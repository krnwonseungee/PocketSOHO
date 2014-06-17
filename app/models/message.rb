class Message < ActiveRecord::Base
  belongs_to :business_owner
  belongs_to :customer
  belongs_to :business
  belongs_to :thread

  def initialize(*args)
    args_hash = args.first
    @text = args_hash[:text]
    @customer_id = args_hash[:customer_id]
    @business_owner_id = args_hash[:business_owner_id]
    @business_id = args_hash[:business_id]
    @thread_mssages = Message.where("business_owner_id = ? AND customer_id = ?", args_hash[:business_owner_id], args_hash[:customer_id] )
    if @thread_messages == nil
      new_thread = Thread.new( customer_id: args_hash[:customer_id], business_owner_id: args_hash[:business_owner_id] )
      thread_id = new_thread.id
    else
      @thread_id = @thread_messages.first.thread_id
    end
  end

end
