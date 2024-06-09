# README
## Users

| Column                 | Type    |Options                    |
| ---------------------- | ------- |-------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| password               | string  | null: false               |
| password_confirmation  | string  | null: false               |
| family_name            | string  | null: false               |
| first_name             | string  | null: false               |
| family_name(zenkaku)   | string  | null: false               |
| first_name(zenkaku)    | string  | null: false               |
| birth_year             | integer | null: false               |
| birth_month            | integer | null: false               |
| birth_day              | integer | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items

| Column    | Type       | Options                        |
| --------- |----------- |------------------------------- |
| name      | string     | null: false                    |
| content   | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| area      | string     | null: false                    |
| load      | string     | null: false                    |
| delivery  | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :shipping_addresses
- has_one :purchase_record


## shipping_addresses
| Column           | Type    | Option      |
| ---------------- | ------- | ----------- |
| post_number      | string  | null: false |
| prefectures      | string  | null: false |
| municipality     | string  | null: false |
| street_address   | string  | null: false |
| building_name    | string  |             |
| telephone_number | integer | null: false |


### Association

- belongs_to :items

## purchase_records
| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item