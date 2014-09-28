class Appointment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business_owner
  belongs_to :business
  belongs_to :invoice

  before_create :assign_invoice_id

  def assign_invoice_id

  end
end

=begin



=end
