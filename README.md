# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|nickname|string|null:false|
|introduction|text||
|email|string|null:false, unique: true, index:true|
|encrypted_password|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|


### Association
- has_many :items,dependent::destroy
- has_many :comments,dependent::destroy
- has_to :deliver_addresses,dependent::destroy
- hass_to :credit_card,dependent::destroy



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|introduction|text|null:false|
|brand|string||
|size|integer||
|item_status|string|null:false|
|shipping_fee_burden|string|null:false|
|shipping_area_from|string|null:false|
|estimated_shipping_date|string|null:false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|


### Association
- has_many :comments
- has_many :item_images
- belongs_to :user
- belongs_to :category

## deliver_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|zip_code|string|null:false|
|city|string|null:false|
|address1|string|null:false|
|apartment-address|string||
|telephone|integer|unique: true|
|family_name|string|
|first_name|string|
|family_name_kana|string|
|first_name_kana|string|
|prefecture_id|integer|null:false|
|user_id|integer|null: false, unique: true|


### Association
- belongs_to :user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|token|text||
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null:false|
|ancestry|string||


### Association
- has_to :items
- has_ancestry

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|src|string|null:false|
|item_id|references|null: false, foreign_key: true|


### Association
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
