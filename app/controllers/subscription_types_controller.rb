class SubscriptionTypesController < ApplicationController

  def create
    @s_type = SubscriptionType.new(params[:subscription_type])
    @s_type.save
  end

  def index
    @s_type = SubscriptionType.new
    @stypes = SubscriptionType.all
  end
end
