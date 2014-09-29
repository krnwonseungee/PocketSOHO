class Appointment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business_owner
  belongs_to :business
  belongs_to :invoice

  before_create :assign_invoice_id

  def assign_invoice_id
    invoice = Invoice.where("customer_id = ? AND business_id = ? AND due_date = ?", self.customer_id, self.business_id, Date.new(self.time.year, self.time.month, -1)).first
    # .where("due_date.month = ?", self.time.month )
    if invoice.nil? #if invoice doesn't exist yet
      self.invoice = Invoice.create(due_date: Date.new(self.time.year, self.time.month, -1), customer_id: self.customer_id, business_id: self.business_id, amount: self.amount)
    else
      self.invoice = invoice
      old_invoice_amt = invoice.amount
      invoice.update(amount: old_invoice_amt + self.amount)
    end
  end
end
