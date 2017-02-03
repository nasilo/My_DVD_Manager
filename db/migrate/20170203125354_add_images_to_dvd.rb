class AddImagesToDvd < ActiveRecord::Migration[5.0]
  def change
    add_column :dvds, :image_small, :string, null: false
    add_column :dvds, :image_large, :string, null: false
  end
end
