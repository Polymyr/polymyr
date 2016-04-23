class GeneralController < ApplicationController

	def home
		@products = Product.all
	end
end

