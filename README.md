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

## users テーブル

| Column     | Type   | Options            |
| ---------- | ------ | ------------------ |
| nickname   | string | null: false        |
| email      | string | null: false UNIQUE |
| encrypted_password  | string | null:false|
| last_name  | text   | null: false        |
| first_name | text   | null: false        |
| birthday   | string | null: false        |

### Association

- has_many :items
- has_one :buyer

## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string     | null: false |
| image         | text     | null: false |
| category      | string   | null: false |
| price         | string     | null: false |
| postage       | string   | null: false |
| seller_name   | text     | null: false |
|user|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :buyer

## buyer テーブル

| Column        | Type       | Options   |
| ------------- | ---------- | --------- |
|user|references|null: false,foreign_key: true|
| address       | references | null: false |

### Association

- belongs_to :user
- belongs_to :items