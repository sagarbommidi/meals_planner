class AddBookingStatusToDailyTransfers < ActiveRecord::Migration
  def change
    add_column :daily_transfers, :booking_status, :boolean, :default => false 
  end
end
