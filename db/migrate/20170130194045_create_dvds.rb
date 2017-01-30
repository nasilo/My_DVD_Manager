class CreateDvds < ActiveRecord::Migration[5.0]
  def change
    create_table :dvds do |t|
      t.string :upc, null: false, unique: true
      t.string :title, null: false
      t.string :purchase_price
      t.string :purchase_location
      t.integer :user_rating
      t.string :mpaa_rating
      t.text :synopsis
      t.string :studio
      t.string :cast
      t.string :writer
      t.string :producer
      t.string :director
      t.string :release_date
      t.string :run_time

      t.timestamps
    end
  end
end
