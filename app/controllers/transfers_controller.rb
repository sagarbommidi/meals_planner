class TransfersController < ApplicationController
  def create
    @transfer = current_user.daily_transfers.create(date: params[:date], subscription_id: params[:subscription_id])
    @transfer.save
  end

  def update
    params[:daily_transfer] = {:borrower_id => current_user.id, :borrower_name => current_user.fullname, :booking_status => true}
    @transfer = DailyTransfer.find(params[:id])
    @transfer.update_attributes(params[:daily_transfer])
  end

  def update_payment_status
    @transfer = DailyTransfer.find(params[:id])
    @transfer.update_attributes(:payment_status => true)
  end

end
