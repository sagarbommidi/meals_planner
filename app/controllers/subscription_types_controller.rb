class SubscriptionTypesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:filter_subscriptions]

  def create
    @s_type = SubscriptionType.new(params[:subscription_type])
    @s_type.save
    get_stypes
  end

  def index
    @s_type = SubscriptionType.new
    get_stypes
  end

  def edit
    @stype = SubscriptionType.find(params[:id])
  end

  def update
    @stype = SubscriptionType.find(params[:id])
    @stype.update_attributes(params[:subscription_type])
    get_stypes
  end

  def destroy
    type = SubscriptionType.find(params[:id])
    type.destroy
    get_stypes
  end

  def filter_subscriptions
    @s_type = SubscriptionType.find(params[:id])
  end

  def working_days_in_month
    @no_of_days = SubscriptionType.working_days_in_month(params[:date])
  end

  private

  def get_stypes
    @stypes = SubscriptionType.all
  end
end
