# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------  | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| family_name_kanji    | string  | null: false |
| first_name_kanji     | string  | null: false |
| family_name_katakana | string  | null: false |
| first_name_katakana  | string  | null: false |
| birthday             | date    | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| image              | string     | null: false                     |
| name               | string     | null: false                     |
| explanation        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| status_id          | integer    | null: false                     |
| shipping_charge_id | integer    | null: false                     |
| shipping_region_id | integer    | null: false                     |
| shipping_day_id    | integer    | null: false                     |
| selling_price      | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
### Association

- belongs_to :user
- has_one :buy

## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options                        |
| --------------      | ---------- | ------------------------------ |
| postal code         | string     | null: false                    |
| shipping_region_id  | integer    | null: false                    |
| city                | string     | null: false                    |
| adress              | string     | null: false                    |
| bulilding_name      | string     |                                |
| phone_number        | string     | null: false                    |
| buy                 | references | null: false, foreign_key: true |

### Association

- belongs_to :buy