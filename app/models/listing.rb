class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :offers
  has_many :reviews
  validates :category_id, presence: true
  belongs_to :condition
  validates :condition_id, presence: true
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
