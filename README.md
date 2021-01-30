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

# テーブル設計

## items テーブル
| Column        | Type         | Options                         |
| ------------- | ------------ | ------------------------------- |
| image         | Activestrage | null: false                     |
| item_name     | string       | null: false                     |
| text          | text         | null: false                     |
| category      | Activehash   | null: false                     |
| state         | Activehash   | null: false                     |
| delivery_fee  | Activehash   | null: false                     |
| delivery_area | Activehash   | null: false                     |
| delivery_time | Activehash   | null: false                     |
| price         | integer      | null: false                     |
| user          | reference    | null: false , foreign_key: true |

### Association

- has_one  :order
- has_many :users,  through: item_users

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :orders
- has_many :items, through: item_users

## order テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| zip_code   | integer    | null: false                     |
| prefecture | Activehash | null: false                     |
| city       | string     | null: false                     |
| addres1    | string     | null: false                     |
| addres2    | string     |                                 |
| tell_num   | string     | null: false                     |
| item       | refrences  | null: false , foreign_key: true |
| user       | refrences  | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
