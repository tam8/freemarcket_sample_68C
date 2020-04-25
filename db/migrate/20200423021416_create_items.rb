class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :status, null: false
      t.string :brand, null: false
      t.integer :shipping_fee, null:false
      t.string :shipping_method, null:false
      t.string :owners_area, null:false
      t.integer :arrival_date, null:false
      t.string :explain
      t.integer :category_id, null: false
      t.integer :user_id, foreign_key: true, null:false
      t.integer :buyer_id
      t.integer :item_image_id, foreign_key: true, null:false
      t.timestamps
    end
  end
end
