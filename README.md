# README
## Users

| Column                 | Type    |Options                    |
| ---------------------- | ------- |-------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false               |
| family_name            | string  | null: false               |
| first_name             | string  | null: false               |
| family_name_zenkaku    | string  | null: false               |
| first_name_zenkaku     | string  | null: false               |
| birth                  | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items

| Column       | Type       | Options                        |
| ------------ |----------- |------------------------------- |
| name         | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| load_id      | integer    | null: false                    |
| delivery_id  | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record


## shipping_addresses
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| post_number      | string     | null: false                   |
| area_id          | integer    | null: false                   |
| municipality     | string     | null: false                   |
| street_address   | string     | null: false                   |
| building_name    | string     |                               |
| telephone_number | string     | null: false                   |
| purchase_record  | references | null: false foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false foreign_key: true |
| item             | references | null: false foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address