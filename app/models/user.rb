class User < ActiveRecord::Base
  before_save :get_ldap_email
  before_save :get_ldap_firstname
  
  has_and_belongs_to_many :subscription_types
  has_many :subscriptions
  has_many :daily_transfers, :foreign_key => :lender_id
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :ldap_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation, :remember_me, :firstname



  def has_currently_subscribed?
    s_type = SubscriptionType.current_subscription_type
  end

  def has_subscribed_next_month?
    s_type = SubscriptionType.next_subscription_type
  end

  def current_subscription
    subscriptions.where(:subscription_type_id => SubscriptionType.current_subscription_type.id).first
  end

  def next_subscription
    subscriptions.where(:subscription_type_id => SubscriptionType.next_subscription_type.id).first
  end

  def transfered_today_meal?
    daily_transfers.find_by_date(Date.today)
  end

  private
  
  def get_ldap_email
    self.email = Devise::LdapAdapter.get_ldap_param(self.login, "mail")
  end
  
  def get_ldap_firstname
    self.firstname = Devise::LdapAdapter.get_ldap_param(self.login, "firstname")
  end

end