class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :status
      t.string :brand
      t.string :shipping_fee
      t.string :shipping_method
      t.string :owners_area
      t.string :arrival_date
      t.string :explain
      t.integer :category_id
      t.integer :user_id, foreign_key: true, null:false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
