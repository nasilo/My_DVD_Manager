class CreateUserHouseholdMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_household_members do |t|
      t.belongs_to :user, null: false
      t.string :household_member_name, null: false

      t.timestamps
    end
  end
end
