class UsersController < ApplicationController
  before_filter :authenticate_user!
	def show
		@s_type_next = SubscriptionType.next_subscription_type
		@s_type_current = SubscriptionType.current_subscription_type
		@current_subscription = current_user.current_subscription if current_user.has_currently_subscribed?
		@next_subscription = current_user.next_subscription || Subscription.new
    @transfer = DailyTransfer.new
	end
end
