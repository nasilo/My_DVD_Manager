class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.text :url
      t.boolean :online, default: false
      t.boolean :physical_location, default: false
      t.text :address

      t.timestamps
    end
  end
end
