# テーブル設計

## usersテーブル

| column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_day    | integer | null: false |

### Association
- has_many: :items
- has_many: :buyers



## itemsテーブル

| column          | Type      | Options                        |
| --------------- | --------- | -------------------------------|
| name            | string    | null: false                    |
| price           | string    | null: false                    |
| explanation     | string    | null: false                    |
| status          | integer   | null: false                    |
| category        | integer   | null: false                    |
| delivery_charge | integer   | null: false                    |
| delivery_area   | integer   | null: false                    |
| delivery_days   | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |


### Association
- belongs_to: :users
- has_one: :buyer



## buyersテーブル

| column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| item      | reference | null: false, foreign_key: true |
| address   | reference | null: false, foreign_key: true |

### Association
- has_one: :address
- belongs_to: :item
- belongs_to: :user



## addressesテーブル

| column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| prefecture   | integer   | null: false                    |
| post_code    | integer   | null: false                    |
| area1        | string    | null: false                    |
| area2        | string    | null: false                    |
| area3        | string    | null: true                     |
| phone_number | integer   | null: false                    |


### Association
- belongs_to: :buyer
