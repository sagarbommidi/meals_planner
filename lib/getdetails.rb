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

def get_ldap_phone
  self.phone = Devise::LdapAdapter.get_ldap_param(self.login, "mobile")
end
