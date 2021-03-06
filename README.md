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
| email      | string |null: false unique: true |
| encrypted_password  | string | null:false|
| last_name  | string | null: false        |
| last_name_furigana  | string | null: false |
| first_name | string | null: false        |
| first_name_furigana | string | null: false |
| birthday   | date   | null: false        |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| name     | string   | null: false |
| explanation | text  | null: false |
| category_id | integer  | null: false |
| status_id   | integer  | null: false |
| price    | integer  | null: false |
| postage_id  | integer  | null: false |
| prefecture_id|integer | null: false |
| days_to_ship_id |integer | null: false |
|user|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer

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

| Column          | Type    | Options            |
| --------------- | ------- | ------------------ |
| postal_code     | string  | null: false        |
| prefecture_id   | integer | null: false        |
| city            | string  | null: false        |
| chome_address   | string  | null: false        |
| building_name   | string  |                    |
| telephone_number| string  | null: false        |
| buyer |references|null: false,foreign_key: true|
### Association

- belongs_to :buyer
