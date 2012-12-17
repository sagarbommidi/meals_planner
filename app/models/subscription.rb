class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :subscription_type
	has_many :daily_transfers
  attr_accessible :payment_status, :subscription_month, :total_amount, :user
end
