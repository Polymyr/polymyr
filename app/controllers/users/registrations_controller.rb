class Users::RegistrationsController < Devise::RegistrationsController

	protected

		def after_sign_in_path_for(resource)
	  	current_user_path
	  end

  private

	  def sign_up_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
	  end
end