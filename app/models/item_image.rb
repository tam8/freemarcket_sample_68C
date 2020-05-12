class ItemImage < ApplicationRecord

  mount_uploader :image, ImageUploader
  # mount_uploader :image, ItemImageUploader
  belongs_to :item
  # validates :image, presence: true
  # 必要ないようなら消去する。 永井
end
