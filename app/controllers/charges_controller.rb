class ChargesController < ApplicationController

	def new
	end

	def create

		# if current_user.name.present? || !current_user.address.present? ||
		# 	 !current_user.city.present? || !current_user.zip.present?
		# 	current_user.update_attribute(:name, params[:name])
		# 	current_user.update_attribute(:address, params[:address])
		# 	current_user.update_attribute(:city, params[:city])
		# 	current_user.update_attribute(:zip, params[:zip])
		# end

		@product = Product.find(params[:product_id])

	  customer = Stripe::Customer.create(
	  	:email 	 => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount 		 => 100,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  current_user.update_attribute(:customer_id, customer.id)
	  Review.create(user_id: current_user.id, product_id: @product.id)

	rescue Stripe::CardError => e
		print(4)
	  flash[:error] = e.message
	  redirect_to @product
	end
end
