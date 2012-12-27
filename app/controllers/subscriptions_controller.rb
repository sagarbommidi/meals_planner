class SubscriptionsController < ApplicationController
	
	def create
    @s_type = SubscriptionType.find(params[:subscription][:subscription_type_id])
    @subscription = @s_type.subscriptions.create(params[:subscription])
    @subscription.save
  end

  def index
		@s_type = SubscriptionType.new
		@subscription = Subscription.new
	end
	
end

