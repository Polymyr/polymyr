require 'elasticsearch/model'

class Product < ActiveRecord::Base
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	belongs_to :maker
	has_many :reviews
	has_many :users, through: :reviews

	has_attached_file :image1, styles: { large: "640x480#", medium: "320x240#", thumb: "50x50#" }
	has_attached_file :image2, styles: { large: "640x480#", medium: "320x240#", thumb: "50x50#" }
	has_attached_file :image3, styles: { large: "640x480#", medium: "320x240#", thumb: "50x50#" }
	has_attached_file :image4, styles: { large: "640x480#", medium: "320x240#", thumb: "50x50#" }
	has_attached_file :image5, styles: { large: "640x480#", medium: "320x240#", thumb: "50x50#" }

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
  validates_attachment :image1, presence: true, content_type: { content_type: /\Aimage\/.*\Z/ }, :if => :active?
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/, :if => :active?
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/, :if => :active?
  validates_attachment_content_type :image4, content_type: /\Aimage\/.*\Z/, :if => :active?
  validates_attachment_content_type :image5, content_type: /\Aimage\/.*\Z/, :if => :active?

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
