class AddLocationKeyToDvds < ActiveRecord::Migration[5.0]
  def change
    add_column :dvds, :location_id, :integer
  end
end
