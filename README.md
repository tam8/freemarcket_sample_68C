# README
* Deployment instructions

* ...
# freemarcket_sample_68C-master データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|index|true, null: false, unique: true|
|address|index|true, null: false|
|email|index|true, null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|year_birth_at|date|null: false|
|month_birth_at|date|null: false|
|day_birth_at|date|null: false|
### Association
- has_many :credit_cards
- has_many :items

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|date|null: false|
|expiration_year|date|null: false|
|card_first_name|string|null: false|
|card_family_name|string|null: false|
|security_code|integer|null: false|
|use_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|status|string|null: false|
|brand|string|null: false|
|shipping_fee|integer|null: false|
|shipping_method|string|null: false|
|owners_area|string|null: false|
|arrival_date|integer|null: false|
|explain|string||
|user_id|reference|null: false, foreign_key: true|
|buyer_id|integer||
### Association
- belongs_to :user
- has_many :items_category
- has_many :category, through: :items_category

## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key true|
|category|reference|null: false, foreign_key true|
### Association
- belongs_to :item
- belongs_to :category

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
- hasmany :items_categories

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item