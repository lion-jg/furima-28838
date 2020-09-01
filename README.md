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
| birth_year           | date   | null: false |
| birth_month          | date   | null: false |
| birth_day            | date   | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| detail                  | text       | null: false                    |
| category                | string     | null: false                    |
| price                   | integer    | null: false                    |
| user_id                 | references | null: false, foreign_key: true |
| item_condition          | string     | null: false                    |
| delivery_fee            | string     | null: false                    |
| shipping_origin         | string     | null: false                    |
| shipping_leadtime       | string     | null: false                    |
| image                   | string     | null: false                    |

### Association

- has_one :purchase
- belongs_to :user



## purchases テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user_id                  | references | null: false, foreign_key: true |
| item_id                  | references | null: false, foreign_key: true |
| creditcard_num           | integer    | null: false                    |
| creditcard_exp_month     | date       | null: false                    |
| creditcard_exp_year      | date       | null: false                    |
| creditcard_security_code | integer    | null: false                    |
| postal_code              | integer    | null: false                    |
| prefecture               | string     | null: false                    |
| city                     | string     | null: false                    |
| block_num                | string     | null: false                    |
| apartment_name           | string     |                                |
| phone_num                | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item


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
