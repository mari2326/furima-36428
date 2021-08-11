# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               | 
| email              | string  | null: false, unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               | 
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               | 
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------  | ------------------------------ |
| title               | String     | null: false                    |
| explanation         | text       | null: false                    | 
| category_id         | integer    | null: false                    |
| scheduled_state_id  | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    | 
| prefecture_id       | integer    | null: false                    |
| scheduled_day _id   | integer    | null: false                    | 
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_kye: true |

### Association

- has_one :buy
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture_id     | string     | null: false                    |
| municipality      | string     | null: false                    |
| street_number     | string     | null: false                    |      
| building_name     | string     |                                |
| telephone_number  | integer    | null: false                    |
| buy               | references | null: false, foreign_key: true |

### Association

- belongs_to :buy