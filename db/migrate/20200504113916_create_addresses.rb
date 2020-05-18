class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zipcode, null: false
      t.integer :owners_area_id
      t.text :city_name, null: false
      t.text :city_number, null: false
      t.text :building_name
      t.references :user
      t.integer :phone_number, unique: true
      t.timestamps
    end
  end
end