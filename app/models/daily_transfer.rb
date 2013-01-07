class DailyTransfer < ActiveRecord::Base

	belongs_to :user, :foreign_key => :lender_id
	belongs_to :subscription
  attr_accessible :borrower_id, :date, :lender_id, :payment_status, 
                  :subscription_id, :booking_status, :borrower_name

  def self.todays_transfer
    where("date = ?", Date.today)
  end


end
 