class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
