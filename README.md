# README
* Deployment instructions

* ...
# freemarcket_sample_68C-master データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|birth_date|date|null: false|
### Association
- has_many :cards
- has_many :items
- has_one :address

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|integer|null: false|
|card_id|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|status|integer||
|brand|integer||
|shipping_fee|integer|null: false|
|shipping_method|integer|null: false|
|owners_area|integer||
|arrival_date|integer||
|explain|string||
|category|references|foreign_key: true|
|user|references|null: false, foreign_key: true|
|buyer_id|integer||
<!--  セレクトボックスで登録するカラム（statsuなど）はactive_hashを利用してidデータを入力すればいい形にしたのでinteger型にしました。-->
### Association
- belongs_to :user
- belongs_to :category
- has_many :item_images, dependent: :destroy
- accepts_nested_attributes_for :item_images, allow_destroy: true  

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
|item|references|null: false, foreign_key: true|
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
