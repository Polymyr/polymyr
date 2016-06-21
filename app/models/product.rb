require 'elasticsearch/model'

class Product < ActiveRecord::Base
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :active, -> { where(status: 'active') }

	belongs_to :maker
	has_many :reviews
	has_many :users, through: :reviews
	has_many :uploads, dependent: :destroy

	validates :maker_id, presence: true
	validates :name, presence: true, length: { maximum: 50 }, :if => :active?
	validates :description, presence: true, length: { maximum: 50 }, :if => :active?
	validates :price, presence: true, numericality: { only_integer: true, 
																										greater_than_or_equal_to: 0, 
																										less_than_or_equal_to: 100000 }, 
																										:if => :active?
	validates :rebate, presence: true, numericality: { only_integer: true, 
																										 greater_than_or_equal_to: 0, 
																										 less_than_or_equal_to: :price }, 
																										 :if => :active?
	validates :quantity, presence: true, numericality: { only_integer: true,
																											 greater_than_or_equal_to: 0,
																											 less_than_or_equal_to: 100000 }, 
																											 :if => :active?
	validates :story, presence: true, length: { maximum: 10000 }, :if => :active?

  settings index: { number_of_shards: 1 }

 #  def as_indexed_json(options = {})
	#   self.as_json({
	#     only: [:name],
	#     include: {
	#       maker: { only: :company }
	#     }
	#   })
	# end

	def active?
    status == 'active'
  end
end

Product.import
