class Conversation < ApplicationRecord
  belongs_to :buyer, :foreign_key => :buyer_id, class_name: "User"
  belongs_to :seller, :foreign_key => :seller_id, class_name: "User"
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :seller_id, :scope => :buyer_id
  scope :between, -> (seller_id,buyer_id) do
    where("(conversations.seller_id = ? AND conversations.buyer_id =?) OR (conversations.seller_id = ? AND conversations.buyer_id =?)", seller_id,buyer_id, buyer_id, seller_id)
  end
end
