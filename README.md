## テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_k           | string  | null: false               |
| first_name_k          | string  | null: false               |
| birth                 | date    | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| name             | string        | null: false                    |
| description      | text          | null: false                    |
| category_id      | integer       | null: false                    |
| status_id        | integer       | null: false                    |
| delivery_fee_id  | integer       | null: false                    |
| delivery_from_id | integer       | null: false                    |
| delivery_day_id  | integer       | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user          | references    | null: false, foreign_key: true |
| item          | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| delivery_from_id | integer       | null: false                    |
| city             | string        | null: false                    |
| street           | string        | null: false                    |
| building         | string        |                                |
| tel              | string        | null: false                    |
| purchase         | references    | null: false, foreign_key: true |


### Association

- belongs_to :purchase

