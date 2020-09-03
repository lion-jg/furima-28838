# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_furigana | string | null: false |
| first_name_furigana  | string | null: false |
| birth                | date   | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user_id                 | references | null: false, foreign_key: true |
| item_name               | string     | null: false                    |
| detail                  | text       | null: false                    |
| category_id             | integer    | null: false                    |
| item_condition_id       | integer    | null: false                    |
| delivery_fee_id         | integer    | null: false                    |
| shipping_origin_id      | integer    | null: false                    |
| shipping_leadtime_id    | integer    | null: false                    |
| price                   | integer    | null: false                    |

 * 画像投稿の際は「active_storage」を用いるので、imageカラムは不要

### Association

- has_one :purchase
- belongs_to :user



## purchases テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user_id                  | references | null: false, foreign_key: true |
| item_id                  | references | null: false, foreign_key: true |

 * セキュリティの観点から、クレジットカードの情報はデータベースに直接保存しない  
 * クレジット決済機能を導入できるAPIのテストモードを使用する

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| purchase_id              | references | null: false, foreign_key: true |
| postal_code              | string     | null: false                    |
| prefecture_id            | integer    | null: false                    |
| city                     | string     | null: false                    |
| block_num                | string     | null: false                    |
| apartment_name           | string     |                                |
| phone_num                | string     | null: false                    |

### Association

- belongs_to :purchase



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
