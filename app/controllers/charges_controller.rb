class ChargesController < ApplicationController

	def new
	end

	def create

		@product = Product.find(params[:product_id])

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount 		 => @product.price * 100,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  current_user.update_attribute(:customer_id, customer.id)
	  Review.create(user_id: current_user.id, product_id: @product.id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
