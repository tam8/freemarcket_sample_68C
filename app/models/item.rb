class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # 不足っぽい
  has_many :item_images
end
