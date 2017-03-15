class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User", optional: true
  has_many :offers
  validates :category_id, presence: true
  belongs_to :condition
  validates :condition_id, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  scope :category, -> (category_id) { where category_id: category_id }
  scope :condition, -> (condition_id) { where condition_id: condition_id }
  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end
end
