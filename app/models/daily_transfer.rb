class DailyTransfer < ActiveRecord::Base

	belongs_to :user
	belongs_to :subscription
  attr_accessible :borrower_id, :date, :lender_id, :payment_status, :subscription_id, :booking_status

end
 