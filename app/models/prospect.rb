class Prospect < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_create :create_referral_code

	validates :email,
    presence: true,
    length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false, message: "This email already exists" }

  private

  	def create_referral_code
	    self.referral_code = UsersHelper.unused_referral_code
	  end
end
