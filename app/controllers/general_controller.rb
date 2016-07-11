class GeneralController < ApplicationController

	layout 'prelaunch_application', only: [:prelaunch]

	def home
		@products = Product.active
	end

	def prelaunch
	end
end

