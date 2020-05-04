class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      # mount_uploaderを使う場合は、imageカラムが存在すれば、.image_urlメソッドで取得できる
      t.string :image, null: false
      t.integer :item_id, foreign_key: true, null:false
      t.timestamps
    end
  end
end
