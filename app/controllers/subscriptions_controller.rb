class SubscriptionsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:update_payment_status]
  
  def create
    @s_type = SubscriptionType.find(params[:subscription][:subscription_type_id])
    @subscription = @s_type.subscriptions.create(params[:subscription])
    @subscription.save
    @s_type_next = SubscriptionType.next_subscription_type
    @s_type_current = SubscriptionType.current_subscription_type
    @current_subscription = current_user.current_subscription if current_user.has_currently_subscribed?
    @next_subscription = current_user.next_subscription || Subscription.new
    UserMailer.delay.subscription_email(current_user)
  end

  def index
    @s_type = SubscriptionType.new
    @subscription = Subscription.new
  end

  def update_payment_status
    subscription = Subscription.find(params[:id])
    subscription.update_attributes(:payment_status => true) unless subscription.blank?
    @s_type = SubscriptionType.find(params[:s_type_id])
  end
  
end