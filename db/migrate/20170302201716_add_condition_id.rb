class AddConditionId < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :condition_id, :integer
  end
end
