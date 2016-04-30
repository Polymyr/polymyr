require 'test_helper'

class MakerTest < ActiveSupport::TestCase

	def setup
		@maker_mike = makers(:maker_mike)
		@maker_vince = makers(:maker_vince)
	end
  
  test "maker mike should be valid" do
	  assert @maker_mike.valid?
	end

	test "maker vince should be valid" do
	  assert @maker_vince.valid?
	end
end
