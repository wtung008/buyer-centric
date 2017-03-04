class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :seller_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
