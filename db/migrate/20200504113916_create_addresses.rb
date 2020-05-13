class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zipcode
      t.integer :owners_area_id
      t.text :city_name
      t.text :city_number
      t.text :building_name
      t.references :user
      t.timestamps
    end
  end
end