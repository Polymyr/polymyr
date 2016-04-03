class ProductsController < ApplicationController

	before_action :authenticate_maker!, except: [:show]

	def new
		@product = Product.new
	end

	def create
		@product = current_maker.products.build(product_params)
		if @product.save
			flash[:success] = "Product launched!"
			redirect_to @product
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
  	flash[:success] = "Product deleted!"
  	redirect_to root_path
  end

	def show
		@product = Product.find(params[:id])
	end

	private

		def product_params
			params.require(:product).permit(:name, :description, :price, :rebate, :quantity,
																			:image1, :image2, :image3, :image4, :image5, :story)
		end
end
