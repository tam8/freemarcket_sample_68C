class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # 不足っぽい
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
