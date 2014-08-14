class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :business_owners, -> { where(type: 'Business Owner') }
  scope :customers, -> { where(type: 'Customer') }

  has_and_belongs_to_many :businesses
end
