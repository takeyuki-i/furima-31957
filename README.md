# テーブル設計

## items テーブル

| Column           | Type      | Options                         |
| ---------------- | --------- | ------------------------------- |
| name             | string    | null: false                     |
| text             | text      | null: false                     |
| category_id      | integer   | null: false                     |
| state_id         | integer   | null: false                     |
| delivery_fee_id  | integer   | null: false                     |
| delivery_area_id | integer   | null: false                     |
| delivery_time_id | integer   | null: false                     |
| price            | integer   | null: false                     |
| user             | reference | null: false , foreign_key: true |

### Association

- has_one    :order
- belongs_to :user

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :orders
- has_many :items

## orders テーブル

| Column      | Type      | Options                         |
| ----------- | --------- | ------------------------------- |
| item        | refrences | null: false , foreign_key: true |
| user        | refrences | null: false , foreign_key: true |
| information | refrences | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :information

## informations テーブル

| Column        | Type      | Options                         |
| ------------- | --------- | ------------------------------- |
| zip_code      | string    | null: false                     |
| prefecture_id | integer   | null: false                     |
| city          | string    | null: false                     |
| addres1       | string    | null: false                     |
| addres2       | string    |                                 |
| tell_num      | string    | null: false                     |
| order         | refrences | null: false , foreign_key: true |

### Association

- belongs_to :order