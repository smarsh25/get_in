class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :school
      t.integer :expected_graduation
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
