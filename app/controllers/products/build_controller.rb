class Products::BuildController < ApplicationController
  include Wicked::Wizard

  before_action :authenticate_maker!
  before_action :correct_maker

  steps :product, :questions, :preview

  def show
    @product = Product.find(params[:product_id])
    render_wizard
  end

  def update
    @product = Product.find(params[:product_id])
    if step == steps.last
      @product.status = "pending"
      if @product.save
        redirect_to @product
      else
        redirect_to :back
      end
    else
      if @product.update_attributes(build_params)
        flash[:success] = "Product launched!" if step == steps.last
        render_wizard @product
      else
        # params[:product][:status] = 'inactive'
        flash[:error] = "There was an error, please try again."
        redirect_to :back
      end
    end
  end

  private 

    def build_params
      params.require(:product).permit(:name, :description, :price, :rebate, :quantity,
                                      :image1, :image2, :image3, :image4, :image5, :story,
                                      :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10,
                                      :q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19, :q20)
    end

    def correct_maker
      @maker = Product.find(params[:product_id]).maker
      if @maker != current_maker
        flash[:error] = "No access permission."
        redirect_to(root_url)
      end
    end
end