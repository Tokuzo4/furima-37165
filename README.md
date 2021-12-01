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
| email      | string | null: false unique: true |
| encrypted_password  | string | null:false|
| last_name  | string | null: false        |
| last_name_furigana  | string | null: false |
| first_name | string | null: false        |
| first_name_furigana | string | null: false |
| birthday   | date   | null: false        |

### Association

- has_many :item
- has_many :buyers

## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string   | null: false |
| item_explanation | text  | null: false |
| item_category | integer  | null: false |
| item_status   | integer  | null: false |
| item_price    | integer  | null: false |
| item_postage  | integer  | null: false |
| item_shipping_area|integer | null: false |
| item_days_to_ship |integer | null: false |
|user|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one :buyers

## buyers テーブル

| Column        | Type       | Options   |
| ------------- | ---------- | --------- |
|user|references|null: false,foreign_key: true|
|item|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type    | Options            |
| ---------------- | ------- | ------------------ |
| postal_code      | integer | null: false        |
| prefecture       | integer | null: false        |
| city             | string  | null: false        |
| town             | string  | null: false        |
| chome_address    | string  | null: false        |
| building_name    | string  |                    |
| telephone_number | integer | null: false        |

### Association

- belongs_to :buyers