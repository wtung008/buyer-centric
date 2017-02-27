class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.datetime :expiration
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
