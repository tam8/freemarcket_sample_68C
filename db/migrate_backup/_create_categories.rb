class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.string :ancestry, index: true
      t.timestamps
    end
    # add_index :categories, :ancestry
  end
end
