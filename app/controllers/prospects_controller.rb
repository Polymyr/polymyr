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
end
