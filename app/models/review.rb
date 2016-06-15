class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates :user_id, presence: true
	validates :product_id, presence: true, uniqueness: { scope: :user_id }

	def active?
    status == 'active'
  end
end
