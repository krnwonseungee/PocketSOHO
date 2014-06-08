class Message < ActiveRecord::Base
  belongs_to :businesses
  belongs_to :users
end
