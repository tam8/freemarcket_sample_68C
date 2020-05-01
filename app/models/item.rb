class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_shipping_fee
  belongs_to_active_hash :item_shipping_method
  belongs_to_active_hash :item_arrival_date
  belongs_to_active_hash :item_category

  # belongs_to :user
  # user管理関係が終わった際に追加 永井
  # belongs_to :category
  # category関係が終わった際に追加 永井
  
  # 不足っぽい
  validates :name,             presence: true
  validates :price,            presence: true
  validates :status,           presence: true
  validates :shipping_fee,     presence: true
  validates :shipping_method,  presence: true
  validates :owners_area,      presence: true
  validates :arrival_date,     presence: true
  validates :explain,          presence: true
  validates :category_id,      presence: true
  
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true  

end
