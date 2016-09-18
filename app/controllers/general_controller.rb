class GeneralController < ApplicationController

	layout 'prelaunch_application', only: [:about]

	def home
		@products = Product.active
	end

	def about
	end
end

