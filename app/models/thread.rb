class Thread < ActiveRecord::Base
  has_one :customer
  has_one :business_owner
  has_many :messages

  def initialize(*args)
    args_hash = args.first
    @customer_id = args_hash[:customer_id]
    @business_owner_id = args_hash[:business_owner_id]
  end

end
