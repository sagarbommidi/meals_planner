require 'workingdays'

class SubscriptionType < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :subscriptions, :dependent => :destroy
  has_and_belongs_to_many :users
  has_many :subscriptions, :dependent => :destroy
  has_and_belongs_to_many :users
  has_many :subscriptions
  attr_accessible :amount_per_day, :month, :number_of_days

  validates_presence_of :amount_per_day, :month, :number_of_days

  default_scope order(:month)

  def self.next_subscription_type
    date1 = Date.today.next_month.at_beginning_of_month
    date2 = date1.at_end_of_month
    where(:month => date1..date2).order([:month]).first
  end

  def self.current_subscription_type
    date1 = Date.today.at_beginning_of_month
    date2 = date1.at_end_of_month
    where(:month => date1..date2).order([:month]).first
  end

  def self.remaining_days
    remaining_days = WorkingDays.calculatingworkingdaysbetween(Date.today,Date.civil(Date.today.year, Date.today.month, -1))
  end

  # 'month' which is a parameter in the below method is the date like '13/05/2013' and the format should be 'dd/mm/yyyy'
  def self.working_days_in_month(month)
    date = Date.parse(month)
    WorkingDays.calculatingworkingdaysbetween(date.at_beginning_of_month, date.at_end_of_month)
  end

  # 'generate_subscription_type' method will be useful to generate the subscription type 
  # for the next month by scheduler.
  def self.generate_subscription_type
    unless next_subscription_type
      date = Date.today.next_month.at_beginning_of_month
      working_days = self.working_days_in_month(date.to_s)
      self.create(:month => date, :number_of_days => working_days)
      # UserMailer.new_subscription_type_email.deliver
      #UserMailer.delay.new_subscription_type_email
    end
  end

  def self.send_reminder
    UserMailer.reminder_to_admin.deliver
  end

end
