require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	def setup
		@product_mike = products(:product_mike)
		@product_vince = products(:product_vince)
	end

  test "mike's product should be valid" do
	  assert @product_mike.valid?
	end

	test "vince's product should be valid" do
	  assert @product_vince.valid?
	end
end
