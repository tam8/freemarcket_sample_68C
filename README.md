# README
* Deployment instructions

* ...
# freemarcket_sample_68C-master データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
<!-- 最初のtrue不要な気がする？ (田村) -->
|nickname|string|true, null: false, unique: true|
<!-- 最初のtrue不要な気がする？ (田村) -->
|email|string|true, null: false, unique: true|
<!-- 足りない気がする？ (田村) -->
|address|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|year_birth_at|date|null: false|
|month_birth_at|date|null: false|
|day_birth_at|date|null: false|
### Association
- has_one :credit_card
- has_many :items
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
|user_id|references|null: false, foreign_key: true|
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
<!-- _id不要な気がする？ (田村) -->
|category_id|references|null: false,foreign_key: true|
<!-- _id不要な気がする？ (田村) -->
|user_id|references|null: false, foreign_key: true|
|buyer_id|integer||
<!-- 足りない気がする？ (田村) -->
|item_image|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
<!-- 足りない気がする？ (田村) -->
- has_many :item_images


## categories
|Column|Type|Options|
|------|----|-------|
|ancestry|string||
|name|string|null: false, unique: true|
### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
<!-- _id不要な気がする？ (田村) -->
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|Prefectures|string|true, null: false|
|City_name|string|true, null: false|
|address|string|true, null: false|
|Building_name|string|true, null: false|
### Association
- belongs_to :user