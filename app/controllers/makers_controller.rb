class MakersController < ApplicationController

	before_action :authenticate_maker!

	def show
		@maker = Maker.find(params[:id])
	end
end
