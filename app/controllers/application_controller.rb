class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
  	user_path(current_user)
  	
  end
   private

  def after_sign_out_path_for(resource)
    root_path
  end
  
end