require 'getdetails'
class User < ActiveRecord::Base

  has_and_belongs_to_many :subscription_types
  has_many :subscriptions, :dependent => :destroy
  has_many :daily_transfers, :foreign_key => :lender_id, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :ldap_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation, :remember_me, :firstname

  before_save :get_ldap_email
  before_save :get_ldap_firstname
  before_save :get_ldap_fullname

  def has_currently_subscribed?
    self.current_subscription.present?
  end

  def has_subscribed_next_month?
    self.next_subscription.present?
  end

  def current_subscription
    subscr_type = SubscriptionType.current_subscription_type
    return nil if subscr_type.nil?
    subscriptions.where(:subscription_type_id => subscr_type.id).first
  end

  def next_subscription
    subscr_type = SubscriptionType.next_subscription_type
    return nil if subscr_type.nil?
    subscriptions.where(:subscription_type_id => subscr_type.id).first
  end

  def transfered_today_meal?
    self.daily_transfers.find_by_date(Date.today).present?
  end

  def get_todays_transfer
    self.daily_transfers.find_by_date(Date.today)
  end

  def get_borrower_name
    self.daily_transfers.find_by_date(Date.today).borrower_name
  end

  def has_borrowed_today?
   transfer = DailyTransfer.where(:borrower_id => self.id, :date => Date.today).first
   transfer.nil? ? false : true
  end
  
end
