class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :address, :postal_code
  end
end
