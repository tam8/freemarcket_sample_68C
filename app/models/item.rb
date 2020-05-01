class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_shipping_fee

  belongs_to :user
  belongs_to :category
  # 不足っぽい
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true  

end
