class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.string :brand, null: false
      t.integer :shipping_fee, null:false
      t.string :shipping_method, null:false
      t.string :owners_area, null:false
      t.integer :arrival_date, null:false
      t.string :explain
      t.references :category_id, foreign_key: true, null:false
      t.references :user_id, foreign_key: true, null:false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
