module User
  class Base < ActiveRecord::Base
    scope :business_owners, -> { where(type: 'Business Owner') }
    scope :customers, -> { where(type: 'Customer') }

    has_and_belongs_to_many :businesses
  end
end
