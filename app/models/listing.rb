class Listing < ApplicationRecord
  belongs_to :category
  has_many :reviews
  validates :category, presence: true
end
