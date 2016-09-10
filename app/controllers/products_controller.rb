class ProductsController < ApplicationController

	before_action :authenticate_maker!, except: [:show]
	before_action :correct_maker, only: [:edit, :update, :destroy]

	def new
		@product = Product.new
	end

	def create
		@product = current_maker.products.build(product_params)
		if @product.save
			redirect_to product_build_path(:product, product_id: @product.id)
		else
			flash.now[:error] = "There was an error, please try again."
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
      flash[:success] = "Product updated!"
      redirect_to @product
    else
    	flash.now[:error] = "There was an error, please try again."
      render 'edit'
    end
  end

  def destroy
  	@product = current_maker.products.find_by(id: params[:id])
  	redirect_to root_path if @product.nil?
  	@product.destroy
  	redirect_to current_maker
  end

	def show
		@product = Product.find(params[:id])
	end

	def dash
		@product = Product.find(params[:id])
		@reviews = @product.reviews
	end

	private

		def product_params
			params.require(:product).permit(:status, :name, :description, :price, :rebate, :quantity,
																			:image1, :image2, :image3, :image4, :image5, :story,
																			:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10,
																			:q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19, :q20)
		end

		def correct_maker
			@maker = Product.find(params[:id]).maker
			if @maker != current_maker
				flash[:error] = "No access permission."
				redirect_to(root_url)
			end
		end
end
