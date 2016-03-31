class Product < ActiveRecord::Base

	belongs_to :maker

	has_attached_file :image1, styles: { large: "500x500#", medium: "350x350#", thumb: "50x50#" }
	has_attached_file :image2, styles: { large: "500x500#", medium: "350x350#", thumb: "50x50#" }
	has_attached_file :image3, styles: { large: "500x500#", medium: "350x350#", thumb: "50x50#" }
	has_attached_file :image4, styles: { large: "500x500#", medium: "350x350#", thumb: "50x50#" }
	has_attached_file :image5, styles: { large: "500x500#", medium: "350x350#", thumb: "50x50#" }

	validates :maker_id, presence: true
	validates :name, presence: true, length: { maximum: 50 }
	validates :price, presence: true, numericality: { only_integer: true, 
																										greater_than_or_equal_to: 0, 
																										less_than_or_equal_to: 100000 }
	validates :rebate, presence: true, numericality: { only_integer: true, 
																										 greater_than_or_equal_to: 0, 
																										 less_than_or_equal_to: :price }
	validates :quantity, presence: true, numericality: { only_integer: true,
																											 greater_than_or_equal_to: 0,
																											 less_than_or_equal_to: 100000 }
	validates :description, presence: true, length: { maximum: 10000 }
  
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image4, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image5, content_type: /\Aimage\/.*\Z/
end
