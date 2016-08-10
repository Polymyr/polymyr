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
		puts 'WHAT'
		require 'net/http'
		uri = URI('https://connect.stripe.com/oauth/token')
		# req = Net::HTTP::Post.new(url.to_s)
		res = Net::HTTP.post_form(
			uri,
			'client_secret' => Rails.application.secrets.stripe_secret_key, 
			'code' => params[:code],
			'grant_type' => 'authorization_code'
		)
		# res = Net::HTTP.start(url.host, url.port) {|http|
		#   http.request(req)
		# }
		puts res.body
	end
end
