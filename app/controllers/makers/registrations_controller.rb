class Makers::RegistrationsController < Devise::RegistrationsController

  private

	  def sign_up_params
	    params.require(:maker).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company, :website)
	  end

	  def account_update_params
	    params.require(:maker).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :company, :website)
	  end
end