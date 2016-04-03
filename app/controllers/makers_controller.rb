class MakersController < ApplicationController

	before_action :authenticate_maker!

	def show
		@maker = Maker.find(params[:id])
		@products = @maker.products
	end
end
