class User < ActiveRecord::Base
  scope :business_owners, -> { where(race: 'Business Owner') }
  scope :customers, -> { where(race: 'Customer') }

  has_and_belongs_to_many :businesses
  has_many :messages
end
