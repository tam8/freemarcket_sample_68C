class RemoveACategoryIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :a_category_id, :integer
  end
end
