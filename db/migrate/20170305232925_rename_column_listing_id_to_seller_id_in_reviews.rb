class RenameColumnListingIdToSellerIdInReviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :listing_id, :seller_id
  end
end
