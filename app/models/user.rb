class User < ActiveRecord::Base
  before_save :get_ldap_email
  before_save :get_ldap_firstname
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :ldap_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation, :remember_me, :firstname
  def get_ldap_email
        self.email = Devise::LdapAdapter.get_ldap_param(self.login, "mail")
    end
   def get_ldap_firstname
        self.firstname = Devise::LdapAdapter.get_ldap_param(self.login, "firstname")
    end
end