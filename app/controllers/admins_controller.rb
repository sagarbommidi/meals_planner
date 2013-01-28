class AdminsController < ApplicationController
	before_filter :authenticate_admin!

  def index
    @current_subscription_type = SubscriptionType.current_subscription_type
    @next_subscription_type = SubscriptionType.next_subscription_type
    @todays_transfers = DailyTransfer.todays_transfer
    @stypes = SubscriptionType.order(:month)
  end
end
