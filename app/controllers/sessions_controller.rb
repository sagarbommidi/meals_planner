class SessionsController < Devise::SessionsController
  def create
  	if params[:admin] && params[:admin][:login] != 'suprajas'
  		redirect_to :back, :alert => "Not an admin user..."
  	else
	    logger.info "Attempt to sign in"
	    super
	 end
  end

  def destroy
    logger.info "#{ current_user.login } signed out"
    super
  end
end
