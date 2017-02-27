class AddSellerIdToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :seller_id, :integer
  end
end
