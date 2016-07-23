class GeneralController < ApplicationController

	def home
		@products = Product.active
	end
end

