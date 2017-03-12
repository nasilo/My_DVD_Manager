class RemovePurchaseLocationFromDvds < ActiveRecord::Migration[5.0]
  def up
    remove_column :dvds, :purchase_location
  end
  
  def down
    add_column :dvds, :purchase_location, :string
  end
end
