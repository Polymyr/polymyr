require 'elasticsearch/model'

class Product < ActiveRecord::Base
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :active, -> { where(status: 'active') }
  scope :pending, -> { where(status: 'pending') }
  scope :started, -> { where(status: nil) }
  scope :past, -> { where(status: 'past') }

	belongs_to :maker
	has_many :reviews
	has_many :users, through: :reviews
	has_many :uploads, dependent: :destroy

	validates :name, presence: true, length: { maximum: 50 }, :if => :pending?
	validates :description, presence: true, length: { maximum: 50 }, :if => :pending?
	validates :price, presence: true, :if => :pending?
	validates :rebate, presence: true, :if => :pending?
	validates :quantity, presence: true, :if => :pending?
	validates :story, presence: true, length: { maximum: 10000 }, :if => :pending?

  settings index: { number_of_shards: 1 }

 #  def as_indexed_json(options = {})
	#   self.as_json({
	#     only: [:name],
	#     include: {
	#       maker: { only: :company }
	#     }
	#   })
	# end

	def pending?
    status == 'pending'
  end
end

Product.import
