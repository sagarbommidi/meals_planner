class SubscriptionTypesController < ApplicationController

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

  private

  def get_stypes
    @stypes = SubscriptionType.all
  end
end
