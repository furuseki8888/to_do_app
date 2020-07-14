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

# Todo-app db設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :todos

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|date|date||
|memo|text||
|finished|boolean|default: false, null: false|
|user_id|references|null: false, foreign_key: true|
- belongs_to :user