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

- has_many :items
- has_many :buyer

## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string   | null: false |
| item_explanation | text  | null: false |
| item_category | string   | null: false |
| item_status   | string   | null: false |
| item_price    | string   | null: false |
| item_postage  | string   | null: false |
| item_shipping_area|string| null: false |
| item_days_to_ship |string| null: false |
|user|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer

## buyer テーブル

| Column        | Type       | Options   |
| ------------- | ---------- | --------- |
|user|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## address テーブル

| Column        | Type       | Options   |
| ------------- | ---------- | --------- |
| postal_code   | string   | null: false |


### Association

- belongs_to :user
- belongs_to :items

## address テーブル

| Column        | Type   | Options            |
| ------------- | ------ | ------------------ |
| postal_code   | string | null: false        |
| prefecture    | string | null: false        |
| city          | string | null: false        |
| town          | string | null: false        |
| chome_address | string | null: false        |
| building_name | string | null: true         |

### Association

- belongs_to :buyer