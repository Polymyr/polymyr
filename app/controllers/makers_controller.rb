class MakersController < ApplicationController

	before_action :authenticate_maker!

	def show
		@maker = current_maker
		@products = @maker.products
		@active_products = @maker.products.active
		@pending_products = @maker.products.pending
		@started_products = @maker.products.started
		@past_products = @maker.products.past
	end

	def payment
	end
end
