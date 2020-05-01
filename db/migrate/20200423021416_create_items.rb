class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.integer :price,             null: false
      t.integer :status
      t.string  :brand
      t.integer :shipping_fee
      t.integer :shipping_method
      t.integer :owners_area
      t.integer :arrival_date
      t.string  :explain
      t.integer :category_id
      # t.integer :user_id, foreign_key: true, null:false
      # user関係の作業が進んでから追加させる。その際reference型にさせるべきか 永井
      t.integer :buyer_id
      t.timestamps
    end
  end
end
