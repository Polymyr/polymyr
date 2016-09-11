class Prospect < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_create :create_referral_code

  belongs_to :referrer, class_name: 'Prospect', foreign_key: 'referrer_id'
  has_many :referrals, class_name: 'Prospect', foreign_key: 'referrer_id'

	validates :email,
    presence: true,
    length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false, message: "This email already exists" }
  validates :referral_code, uniqueness: true

  private

  	def create_referral_code
	    self.referral_code = ProspectsHelper.unused_referral_code
	  end
end
