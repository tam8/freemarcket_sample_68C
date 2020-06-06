class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :owners_area
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :arrival_date

  belongs_to :user
  belongs_to :category
  # category関係が終わった際に追加 永井


  # belongs_toになっていれば、_idは不要
  validates :name,             presence: true
  validates :price,            presence: true
  validates :status,           presence: true
  validates :shipping_fee,     presence: true
  validates :shipping_method,  presence: true
  validates :owners_area,      presence: true
  validates :arrival_date,     presence: true
  validates :explain,          presence: true

  validates :price,              numericality: { only_integer: true,
                                                 greater_than_or_equal_to: 300,
                                                 less_than: 10000000}

  # (田村) 下記を数値に限定すると、バリデーションエラーのメッセージが数値入力を求めるものになるため、(セレクトボックスからの選択のため) ここは不要と思いました
  # validates :status,          numericality: { only_integer: true,
  #                                                greater_than_or_equal_to: 1,
  #                                                less_than: 7}
  # validates :shipping_fee,    numericality: { only_integer: true,
  #                                                greater_than_or_equal_to: 1,
  #                                                less_than: 3}
  # validates :shipping_method, numericality: { only_integer: true,
  #                                                greater_than_or_equal_to: 1,
  #                                                less_than: 9}
  # validates :owners_area,     numericality: { only_integer: true,
  #                                                greater_than_or_equal_to: 1,
  #                                                less_than: 48}
  # validates :arrival_date,    numericality: { only_integer: true,
  #                                                 greater_than_or_equal_to: 1,
  #                                                 less_than: 4}


  # dependentで商品削除時に画像も削除
  has_many :item_images, dependent: :destroy


  # item削除時にimageも削除される
  accepts_nested_attributes_for :item_images, allow_destroy: true  
  validates :item_images,       presence: true

  scope :search, -> (search){ where('name LIKE ?', "%#{search}%" )}
end
