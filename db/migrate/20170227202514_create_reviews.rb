class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :listing_id

      t.timestamps
    end
  end
end
