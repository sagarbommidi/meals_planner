class SubscriptionType < ActiveRecord::Base
	belongs_to :user
	has_many :subscriptions
  attr_accessible :amount_per_day, :month, :number_of_days

  validates_presence_of :amount_per_day, :month, :number_of_days
end
