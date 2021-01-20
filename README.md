## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_kana           | string | null: false |
| first_kana          | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_one :address
- has_one :buy_item

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| item_name            | string     | null: false |
| item_info            | text       | null: false |
| category_id          | integer    | null: false |
| status_id            | integer    | null: false |
| shipping_cost_id     | integer    | null: false |
| area_id              | integer    | null: false |
| delivery_schedule_id | integer    | null: false |
| price                | integer    | null: false |
| user                 | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- has_one :buy_item

## addresses テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| postal_code       | string  | null: false |
| prefecture_id     | integer | null: false |
| city              | string  | null: false |
| address           | string  | null: false |
| building          | string  | 
| phone_number      | string  | null: false |
| buy_item          | references | null: false, foreign_key: true |


## buy_items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| buy_user_id | integer | null: false |
| buy_item_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
