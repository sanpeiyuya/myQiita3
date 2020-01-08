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
# myQiita3 DB設計

## usersテーブル
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

## postsテーブル
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
- has_many :posts_categorys
- has_many  :categorys,  through:  :posts_categorys

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :posts_categorys
- has_many :posts,  through:  :posts_categorys

## posts_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :category

## likesテーブル
|Column|Type|Opthions|
|------|----|--------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
- belongs_to :post
- belongs_to :user