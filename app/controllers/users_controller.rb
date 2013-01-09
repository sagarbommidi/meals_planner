class UsersController < ApplicationController

	def show
		@s_type_next = SubscriptionType.next_subscription_type || build_subscription_type
		@s_type_current = SubscriptionType.current_subscription_type || build_subscription_type
		@current_subscription = current_user.current_subscription if current_user.has_currently_subscribed?
		@next_subscription = current_user.next_subscription || Subscription.new
    @transfer = DailyTransfer.new
	end


protected

  def build_subscription_type
    SubscriptionType.new(
      :amount_per_day => 45,
      :number_of_days => 30
    )
  end
end
