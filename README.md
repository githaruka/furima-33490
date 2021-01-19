# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profile
- has_oen :card
- has_one :address

## profiles テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| last_name  | string     | null: false |
| first_name | string     | null: false |
| last_kana  | string     | null: false |
| first_kana | string     | null: false |
| birthday   | string     | null: false |
| user       | references |

### Association
- belongs_to :user

## items テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| item_name | string     | null: false |
| item_info | text       | null: false |
| user      | references |

### Association

- belongs_to :user
- has_one :item_info

## item_infos テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| category          | string     | null: false |
| status            | string     | null: false |
| shipping_cost     | string     | null: false |
| area              | string     | null: false |
| delivery_schedule | string     | null: false |
| price             | integer    | null: false |
| item              | references |

### Association

- belongs_to :item

## card テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| card_number       | integer    | null: false |
| card_exp_month    | integer    | null: false |
| card_exp_year     | integer    | null: false |
| card_code         | integer    | null: false |
| user              | references |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| postal_code       | integer    | null: false |
| prefecture        | string     | null: false |
| city              | string     | null: false |
| address           | string     | null: false |
| building          | string     | 
| phone_number      | integer    | null: false |

### Association

- belongs_to :card
- belongs_to :user

