# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------  | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| family_name(kanji)   | string  | null: false |
| first_name(kanji)    | string  | null: false |
| family_name(katakana)| string  | null: false |
| first_name(katakana) | string  | null: false |
| birthday             | date    | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :messages

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping charges| integer    | null: false                    |
| shipping region | string     | null: false                    |
| shipping days   | string     | null: false                    |
| selling price   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :buys
- has_many :comments

## buys テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card number           | integer    | null: false                    | 
| expiration date(month)| integer    | null: false                    |
| expiration date(year) | integer    | null: false                    |
| security code         | integer    | null: false                    |
| postal code           | integer    | null: false                    |
| prefectures           | string     | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building name         | string     |                                |
| phone number          | integer    | null: false                    |
| item_id               | references | null: false, foreign_key: true |
| user_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## commnts テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| comment              | text       |                                |
| item_id              | references | null: false, foreign_key: true |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item