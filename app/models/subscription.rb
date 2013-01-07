class Subscription < ActiveRecord::Base
  require 'workingdays'
	belongs_to :user
	belongs_to :subscription_type
	has_many :daily_transfers, :dependent => :destroy
  attr_accessible :payment_status, :subscription_month, :total_amount, :user_id, :subscription_type_id

  before_create :update_associations

  private

  def update_associations
  	self.user.subscription_types << self.subscription_type
  	self.subscription_type.users << self.user
  	self.user.save
  	self.subscription_type.save
  end
 
end
