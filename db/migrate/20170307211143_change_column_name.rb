class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :user_id, :buyer_id
    rename_column :reviews, :user_id, :buyer_id
  end
end
