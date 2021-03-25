# テーブル設計

## usersテーブル

| column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birthday           | date    | null: false              |

### Association
- has_many: :items
- has_many: :buyers



## itemsテーブル

| column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| name               | string    | null: false                    |
| price              | integer   | null: false                    |
| explanation        | text      | null: false                    |
| status_id          | integer   | null: false                    |
| category_id        | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| delivery_area_id   | integer   | null: false                    |
| delivery_days_id   | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |


### Association
- belongs_to: :user
- has_one: :buyer



## buyersテーブル

| column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| item      | reference | null: false, foreign_key: true |


### Association
- has_one: :address
- belongs_to: :item
- belongs_to: :user



## addressesテーブル

| column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| prefecture_id | integer   | null: false                    |
| post_code     | string    | null: false                    |
| area_city     | string    | null: false                    |
| area_address  | string    | null: false                    |
| area_building | string    | null: true                     |
| phone_number  | string    | null: false                    |
| buyer         | reference | null: false, foreign_key: true |


### Association
- belongs_to: :buyer
