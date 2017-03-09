class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, password_length: 8..30
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  has_many :buyer_listings, class_name: "Listing", foreign_key: "buyer_id"
  has_many :seller_listings, class_name: "Listing", foreign_key: "seller_id"
  has_many :offers
  has_many :buyer_reviews, class_name: "Review", foreign_key: "buyer_id"
  has_many :seller_reviews, class_name: "Review", foreign_key: "seller_id"
  validates :email, uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_presence_of :first_name, :last_name

  geocoded_by :address
  after_validation :geocode


end
