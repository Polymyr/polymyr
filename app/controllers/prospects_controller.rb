class ProspectsController < ApplicationController

	layout 'prelaunch_application', only: [:new]

	def new
		@prospect = Prospect.new
	end

	def create
		@prospect = Prospect.find_by_email(prospect_params[:email])
		if @prospect
			redirect_to @prospect
		else
			if enforce_ip_block
				return
			@prospect = Prospect.new(prospect_params)
			if @prospect.save
				redirect_to @prospect
			else
				render 'new'
			end
		end
	end

	def show
		@prospect = Prospect.find(params[:id])
	end

	private

		def prospect_params
			params.require(:prospect).permit(:email, :referral_code)
		end

		def enforce_ip_block
	    # Prevent someone from gaming the site by referring themselves.
	    # Presumably, users are doing this from the same device so block
	    # their ip after their ip appears three times in the database.

	    address = request.remote_ip
	    return if address.nil?

	    current_ip = IpAddress.find_by_address(address)
	    if current_ip.nil?
	      current_ip = IpAddress.create(address: address, count: 1)
	    elsif current_ip.count > 2
	      logger.info('IP address has already appeared three times in our records.
	                 Redirecting user back to landing page.')
	      flash[:error] = "Too many signups from this IP address"
	      redirect_to unauthenticated_root_path
	    else
	      current_ip.count += 1
	      current_ip.save
	    end
	  end
end
