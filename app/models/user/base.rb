module User
  class Base < ActiveRecord::Base
    self.table_name = 'users'
    scope :business_owners, -> { where(type: 'Business Owner') }
    scope :customers, -> { where(type: 'Customer') }

    has_and_belongs_to_many :businesses
    has_many :messages
  end
end
