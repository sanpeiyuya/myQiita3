# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.5.1
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# URL
3.115.218.237
# myQiita3 DB_design

## users_tables
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, uniqueness: true|
|password|string|null: false|
|nickname|string|null: false|
|name|string|presence: true|
### Association
- has_many :posts
- has_many :comments
- has_many :likes

## posts_tables
|Column|Type|Options|
|------|----|-------|
|image|text||
|title|string|null: false|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :posts_tags
- has_many  :categorys,  through:  :posts_tags

## comments_tables
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## tags_tables
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :posts_tags
- has_many :posts,  through:  :posts_tags

## posts_tags_tables
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## likes_tabeles
|Column|Type|Opthions|
|------|----|--------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
- belongs_to :post
- belongs_to :user