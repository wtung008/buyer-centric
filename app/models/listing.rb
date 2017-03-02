class Listing < ApplicationRecord
  belongs_to :category
  has_many :reviews
  validates :category_id, presence: true
  belongs_to :condition
  validates :condition_id, presence: true
end
