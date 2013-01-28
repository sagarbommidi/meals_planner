class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery

  layout :layout_by_resource

  protected

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admins_path(current_admin) : home_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def layout_by_resource
    if devise_controller?
      "home"
    else
      "application"
    end
  end
    
end
