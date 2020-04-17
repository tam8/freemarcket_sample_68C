# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

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
|card_number|true|
|expiration_month|date|null: false|
|expiration_year|date|null: false|
|card_first_name|string|null: false|
|card_family_name|string|null: false|
|security_code|integer|null: false|
|use_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :users

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
|explain|string|
|user_id|reference|null: false, foreign_key: true|
|buyer_id|integer|
### Association
- belongs_to :users
- has_many :items_categorys
- has_many :item_images

## items_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key true|
|category_id|reference|null: false, foreign_key true|
### Association
- belongs_to :items
- belongs_to :categorys

## categorys
|Column|Type|Options|
|------|----|-------|