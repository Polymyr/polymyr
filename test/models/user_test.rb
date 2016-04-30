require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@mike = users(:user_mike)
		@vince = users(:user_vince)
	end
  
  test "user mike should be valid" do
	  assert @mike.valid?
	end

	test "user Vince should be valid" do
	  assert @vince.valid?
	end
end
