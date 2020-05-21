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
|username|string|null:false|
|username_kana|string|null:false|
|nickname|string|null:false|
|email|string|null:false, unique: true, index:true|
|password|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|


### Association
- has_many :items
- has_many :comments
- has_many :item_images
- belongs_to :deliver_adresses
- belongs_to :credit_info

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|introduction|text|null:false|
|brand|string||
|size|integer||
|item_status|string|null:false|
|Shipping_fee_burden|string|null:false|
|Shipping_area_from|string|null:false|
|Estimated_shipping_date|string|null:false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|


### Association
- has_many :comments
- has_many :item_images
- belongs_to :user
- belongs_to :category

## deliver_adressesテーブル

|Column|Type|Options|
|------|----|-------|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|adress1|string|null:false|
|apartment-adress|string||
|telephone|integer|unique: true|
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user

## credit_infoテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user

## categoryテーブル

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

## item_imageテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|text|null:false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
