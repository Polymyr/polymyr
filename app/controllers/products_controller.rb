class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.build(product_params)
	end

	def show
		@product = Product.find(params[:id])
	end

	private

		def product_params
			params.require(:product).permit(:name, :description, :price, :rebate, :quantity)
		end
end
