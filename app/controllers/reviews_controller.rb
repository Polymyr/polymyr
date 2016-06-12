class ReviewsController < ApplicationController
	include Wicked::Wizard

	steps :context, :setup, :review, :conclusion

	def show
		@review = Review.find(params[:id])
		render_wizard
	end

	def update
    @product = Product.find(params[:product_id])
    @product.update_attributes(params[:product])
    render_wizard @product
  end
end
