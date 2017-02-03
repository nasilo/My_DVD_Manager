class CreateUpcs < ActiveRecord::Migration[5.0]
  def change
    create_table :upcs do |t|
      t.string :upc, null: false, unique: true
    end
  end
end
