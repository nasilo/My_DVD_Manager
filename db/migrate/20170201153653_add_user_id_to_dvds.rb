class AddUserIdToDvds < ActiveRecord::Migration[5.0]
  def change
    add_column :dvds, :user_id, :integer, null: false
  end
end
