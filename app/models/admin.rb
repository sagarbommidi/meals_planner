class Admin < ActiveRecord::Base

	before_save :get_ldap_email
	before_save :get_ldap_firstname
  before_save :get_ldap_fullname
  	
	devise :ldap_authenticatable, :rememberable, :trackable
	attr_accessible :login, :password, :password_confirmation, :remember_me
	
	validates_presence_of :email

	private
	
	def get_ldap_email
      self.email = Devise::LdapAdapter.get_ldap_param(self.login, "mail")
  end

  def get_ldap_firstname
      self.firstname = Devise::LdapAdapter.get_ldap_param(self.login, "firstname")
  end

  def get_ldap_fullname
    self.fullname = Devise::LdapAdapter.get_ldap_param(self.login, "cn")
  end
  
end
