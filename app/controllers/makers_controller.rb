class MakersController < ApplicationController

	before_action :authenticate_maker!

	def show
		@maker = current_maker
		@products = @maker.products
		@active_products = @maker.products.active
		@pending_products = @maker.products.pending
		@started_products = @maker.products.started
		@past_products = @maker.products.past
	end

	def payment
	end

	def stripe_connect
		require 'net/http'
		require 'json'
		uri = URI('https://connect.stripe.com/oauth/token')
		res = Net::HTTP.post_form(
			uri,
			'client_secret' => Rails.application.secrets.stripe_secret_key, 
			'code' => params[:code],
			'grant_type' => 'authorization_code'
		)
		# res = Net::HTTP.start(url.host, url.port) {|http|
		#   http.request(req)
		# }
		credentials = JSON.parse(res.body)
		if current_maker.update_attributes({
			stripe_publishable_key: credentials['stripe_publishable_key'],
	    stripe_user_id: credentials['stripe_user_id'],
	    refresh_token: credentials['refresh_token'],
	    access_token: credentials['access_token']
		})
			flash[:success] = "Successfully connected Stripe!"
			if params[:state]
				redirect_to product_build_path(:payment, product_id: params[:state])
			else
				redirect_to payment_maker_path(current_maker)
			end
		else
			flash.now[:error] = "Failed to connect Stripe"
			if params[:state]
				redirect_to product_build_path(:payment, product_id: params[:state])
			else
				redirect_to payment_maker_path(current_maker)
			end
		end
	end
end
