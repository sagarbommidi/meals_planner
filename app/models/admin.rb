require 'getdetails'
class Admin < ActiveRecord::Base

	devise :ldap_authenticatable, :rememberable, :trackable
	attr_accessible :login, :password, :password_confirmation, :remember_me
  
  before_save :get_ldap_email
  before_save :get_ldap_firstname
  before_save :get_ldap_fullname
	
	validates_presence_of :email
end
