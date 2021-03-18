## テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_k           | string  | null: false               |
| first_name_k          | string  | null: false               |
| birth_year            | integer | null: false               |
| birth_month           | integer | null: false               |
| birth_day             | integer | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| image         | ActiveStorage | null: false                    |
| name          | string        | null: false                    |
| description   | text          | null: false                    |
| category      | string        | null: false                    |
| status        | string        | null: false                    |
| delivery_fee  | string        | null: false                    |
| delivery_from | string        | null: false                    |
| delivery_days | string        | null: false                    |
| price         | integer       | null: false                    |
| user_id       | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user_id       | references    | null: false, foreign_key: true |
| item_id       | references    | null: false, foreign_key: true |
| created_at    | datetime      | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| postal_code   | ActiveStorage | null: false                    |
| prefectures   | string        | null: false                    |
| city          | string        | null: false                    |
| street        | string        | null: false                    |
| building      | string        |                                |
| tel           | integer       | null: false                    |
| purchase_id   | references    | null: false, foreign_key: true |


### Association

- belongs_to :purchase

