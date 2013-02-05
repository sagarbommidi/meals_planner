require 'workingdays'

class SubscriptionType < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :subscriptions, :dependent => :destroy
  has_and_belongs_to_many :users
  has_many :subscriptions
  attr_accessible :amount_per_day, :month, :number_of_days

  validates_presence_of :amount_per_day, :month, :number_of_days

  default_scope order(:month)

  def self.next_subscription_type
    where("month > ?", Date.today).order([:month]).first
  end

  def self.current_subscription_type
    where("month <= ?", Date.today).order([:month]).last
  end

  def self.remaining_days
    remaining_days = WorkingDays.calculatingworkingdaysbetween(Date.today,Date.civil(Date.today.year, Date.today.month, -1))
  end

  def self.working_days_in_month(month)
    date = Date.parse(month)
    WorkingDays.calculatingworkingdaysbetween(date.at_beginning_of_month, date.at_end_of_month)
  end

end
