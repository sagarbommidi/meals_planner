class SessionsController < Devise::SessionsController
  
  def create
  	if params[:admin] && params[:admin][:login] != 'sagarb'
  		redirect_to :back, :alert => "Not an admin user..."
  	else
	    logger.info "Attempt to sign in"
	    super
	 end
  end

  def destroy
    super
  end
end
