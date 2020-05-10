class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :owners_area
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :arrival_date
  belongs_to_active_hash :a_category

  # belongs_to :user
  # user管理関係が終わった際に追加 永井
  # belongs_to :category
  # category関係が終わった際に追加 永井
  
  # 不足っぽい
  validates :name,                presence: true
  validates :price,               presence: true
  validates :status_id,           presence: true
  validates :shipping_fee_id,     presence: true
  validates :shipping_method_id,  presence: true
  validates :owners_area_id,      presence: true
  validates :arrival_date_id,     presence: true
  validates :explain,             presence: true
  validates :a_category_id,       presence: true
  

  validates :price,              numericality: { only_integer: true,
                                                 greater_than_or_equal_to: 300,
                                                 less_than: 10000000}
  validates :status_id           numericality: { only_integer: true,
                                                 greater_than_or_equal_to: 1,
                                                 less_than: 7}
  validates :shipping_fee_id     numericality: { only_integer: true,
                                                 greater_than_or_equal_to: 1,
                                                 less_than: 3}
  validates :shipping_method_id  numericality: { only_integer: true,
                                                 greater_than_or_equal_to: 1,
                                                 less_than: 9}
  

  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true  
  validates :item_images,       presence: true

end
