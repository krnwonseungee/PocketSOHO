class Invoice < ActiveRecord::Base
  belongs_to :business
  belongs_to :customer
  has_many :appointments

  before_create :create_attributes

  def create_attributes
    first_appt = self.appointments.first
    self.due_date = Date.new(first_appt.date.year, first_appt.date.month, -1)
    self.customer = first_appt.customer
    self.business = first_appt.business
    # self.amount = self.appointments.pluck(:)
  end
end
