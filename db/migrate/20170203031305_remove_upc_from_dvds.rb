class RemoveUpcFromDvds < ActiveRecord::Migration[5.0]
  def up
    remove_column :dvds, :upc
    add_column :dvds, :upc_id, :integer, null: false
    change_column_null(:dvds, :user_id, false)
  end
  def down
    add_column :dvds, :upc, :string, null: false
    remove_column :dvds, :upc_id
    change_column_null(:dvds, :user_id, true)
  end
end
