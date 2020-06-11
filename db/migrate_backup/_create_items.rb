class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.string :ancestry, index: true
      t.timestamps
    end
    # add_index :categories, :ancestry

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
      t.references :category, foreign_key: true, null: false
      t.references :user, foreign_key: true, null:false
      # t.string :user_id, foreign_key: true, null: false
      t.integer :buyer_id
      t.timestamps
    end

    create_table :item_images do |t|
      # mount_uploaderを使う場合は、imageカラムが存在すれば、.image_urlメソッドで取得できる
      t.string :image
      t.references :item, foreign_key: true, null:false
      t.timestamps
    end

  end
end
