class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.string :image_url, null: false
      t.integer :item_id, foreign_key: true, null:false
      t.timestamps
    end
  end
end
