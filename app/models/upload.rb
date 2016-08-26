class Upload < ActiveRecord::Base

	belongs_to :product

	has_attached_file :image, 
		:styles => { 
			large: "640x480#", 
			medium: "320x240#", 
			thumb: "60x45#" 
		},
		:s3_protocol => :https

	
	validates_attachment :image,
				presence: true,
				content_type: { content_type: /\Aimage\/.*\Z/ },
				size: { :less_than => 1.megabyte }
end