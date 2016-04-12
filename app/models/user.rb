class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :reviews
  has_many :products, through: :reviews

  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { maximum: 50 } 
  validates :email,
    presence: true,
    length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
end
