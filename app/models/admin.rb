class Admin < ActiveRecord::Base

	before_save :get_ldap_email
	before_save :get_ldap_firstname
	# before_save :check_admin
  	
  	devise :ldap_authenticatable, :rememberable, :trackable
  	attr_accessible :login, :password, :password_confirmation, :remember_me
  	
  	validate :check_admin, :on => :create
  	validates_presence_of :email

  	def get_ldap_email
        self.email = Devise::LdapAdapter.get_ldap_param(self.login, "mail")
    end
    def get_ldap_firstname
        self.firstname = Devise::LdapAdapter.get_ldap_param(self.login, "firstname")
    end

    protected

  	def check_admin
  		get_ldap_email
  	  	# errors.add(:email, "Not admin...") unless self.email.eql? "supraja.s@imaginea.com"
  	  	self.email = "" unless self.email.eql? "supraja.s@imaginea.com"
  	end

end
