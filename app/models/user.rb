class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, password_length: 8..30
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings
  has_many :offers
  validates :email, uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
