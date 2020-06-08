class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.integer :price,             null: false
      t.integer :status_id
      t.string  :brand
      t.integer :shipping_fee_id
      t.integer :shipping_method_id
      t.integer :owners_area_id
      t.integer :arrival_date_id
      t.string  :explain
      t.integer :a_category_id
      # t.references :user, foreign_key: true, null:false
      # 後のマイグレーションファイルにてuser_idの外部キーを設定しています。
      t.string :user_id, foreign_key: true, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
