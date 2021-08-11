# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| encrypted_password | string  | null: false | 
| email              | string  | null: false |
| name               | string  | null: false |
| name_kana          | string  | null: false | 
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------  | ------------------------------ |
| title              | text       | null: false                    |
| explanation        | text       | null: false                    | 
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| shipping charges   | string     | null: false                    | 
| area               | string     | null: false                    |
| days               | string     | null: false                    | 
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_kye: true |

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
| post code         | string     | null: false                    |
| prefectures       | string     | null: false                    |
| municipalities    | string     | null: false                    |
| street number     | string     | null: false                    |      
| building name     | text       |                                |
| telephone number  | integer    | null: false                    |
| buy               | references | null: false, foreign_key: true |

### Association

- belongs_to :buy