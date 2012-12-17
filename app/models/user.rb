class User < ActiveRecord::Base
  before_save :get_ldap_email
  before_save :get_ldap_firstname
  
  has_many :subscription_types
  has_many :subscriptions
  has_many :daily_transfers
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :ldap_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation, :remember_me, :firstname
  
  private
  
  def get_ldap_email
    self.email = Devise::LdapAdapter.get_ldap_param(self.login, "mail")
  end
  
  def get_ldap_firstname
    self.firstname = Devise::LdapAdapter.get_ldap_param(self.login, "firstname")
  end

end