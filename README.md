# README
* Deployment instructions

* ...
# freemarcket_sample_68C-master データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|true, null: false, unique: true|
|email|string|true, null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|year_birth_at|date|null: false|
|month_birth_at|date|null: false|
|day_birth_at|date|null: false|
### Association
- has_one :credit_cards
- has_one :items
- has_one :address, dependent: :destroy

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_month|date|null: false|
|expiration_year|date|null: false|
|card_first_name|string|null: false|
|card_family_name|string|null: false|
|security_code|integer|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|status|integer|null: false|
|brand|string|null: false|
|shipping_fee|integer|null: false|
|shipping_method|string|null: false|
|owners_area|string|null: false|
|arrival_date|integer|null: false|
|explain|string||
|categories_id|reference|null: false,foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
|buyer_id|integer||
### Association
- belongs_to :user
- has_many :items_categories
- has_many :category, through: :items_categories


## categories
|Column|Type|Options|
|------|----|-------|
|ancestry|string||
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

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|Prefectures|string|true, null: false|
|City_name|string|true, null: false|
|address|string|true, null: false|
|Building_name|string|true, null: false|
### Association
- belongs_to :user