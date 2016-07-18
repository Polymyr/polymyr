class ProspectsController < ApplicationController

	layout 'prelaunch_application'

	def new
		@prospect = Prospect.new
	end

	def create
		@prospect = Prospect.new(prospect_params)
		if @prospect.save
			redirect_to :back
		else
			flash.now[:error] = "There was an error, please try again."
			render 'new'
		end
	end

	private

		def prospect_params
			params.require(:prospect).permit(:name, :email)
		end
end
