class SearchController < ApplicationController

	def search
		if params[:query].present?
			@products = Product.__elasticsearch__.search(params[:query]).records
	  else
	    @products = Product.all
	  end
	end
end
