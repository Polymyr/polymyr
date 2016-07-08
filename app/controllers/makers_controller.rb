class MakersController < ApplicationController

	before_action :authenticate_maker!

	def show
		@maker = Maker.find(params[:id])
		@active_products = @maker.products.active
		@pending_products = @maker.products.pending
		@started_products = @maker.products.started
		@past_products = @maker.products.past
	end
end
