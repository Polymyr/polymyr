class Makers::RegistrationsController < Devise::RegistrationsController

	protected

		def after_sign_up_path_for(resource)
	    maker_path(resource)
	  end

	  def after_sign_in_path_for(resource)
	  	maker_path(resource)
	  end

  private

	  def sign_up_params
	    params.require(:maker).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company, :website)
	  end

	  def account_update_params
	    params.require(:maker).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :company, :website)
	  end
end