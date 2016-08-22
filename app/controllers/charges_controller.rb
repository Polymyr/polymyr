class ChargesController < ApplicationController

	before_action :authenticate_user!

	def new
	end

	def create

		@product = Product.find(params[:product_id])
		@maker = @product.maker

		if !current_user.name.present? || !current_user.address.present? ||
			 !current_user.city.present? || !current_user.zip.present?
			current_user.update(:name => params[:name])
		  current_user.update(:address => params[:address])
		  current_user.update(:city => params[:city])
		  current_user.update(:zip => params[:zip])
		end

		if !current_user.customer_id.present?
			customer = Stripe::Customer.create(
		  	:email 	 => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount 		 => @product.price * 100,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		  )

		  current_user.update_attribute(:customer_id, customer.id)
		else
			Stripe::Charge.create(
				:customer 	 => current_user.customer_id,
			  :amount   	 => @product.price * 100,
			  :description => 'Rails Stripe customer',
			  :currency 	 => "usd",
			  :destination => @maker.stripe_user_id
			)
		end

	  Review.create(user_id: current_user.id, product_id: @product.id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to @product
	end
end
