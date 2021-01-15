# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| last_name     | string | null: false |
| first_name    | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |
| nickname | string | null: false |
| email | string | null: false,unique:true |
| encrypted_password | string | null: false |



### Association

- has_many: products, dependent: :destroy
- has_many: comments, dependent: :destroy
- has_many: purchases, dependent: :destroy
- has_many: likes, dependent: :destroy


## products テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price  | integer | null: false |
| explanation | text | null: false |
| quality_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| delivery_date_id | integer | null: false |
| trading_status_id | integer | null: false |
| area_id   | integer | null: false |
| user_id | references | null: false,foreign_key: true |
| category_id | references | null: false,foreign_key: true |



### Association

- belongs_to: user
- belongs_to: purchases
- has_many: comments, dependent: :destroy
- has_many: likes , dependent: :destroy
- belongs_to: brand
- belongs_to :category



## brands テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |

### Association

- has_many: products

### comments テーブル

| Column	| Type	     |Options                        |
| comment | text       | null: false                   |
| user | references | null: false,foreign_key: true |
| product | references | null: false,foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product

### likes テーブル

| Column | Type        |	Options                         |
| user | references | null: false,foreign_key: true    |
| product | references | null: false,foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product


### purchase テーブル

| Column	| Type	|Options                                   |
| user_id	| references	| null: false,foreign_key: true      |
| product_id |	references	| null: false,foreign_key: true  |

### Association

- belongs_to: user
- belongs_to: product
- has_one: address

### address テーブル

| Column	| Type	| Options                                  |
| tell    | string | null: false                             |
| user    | references | null: false, foreign_key: true      |
| postal_code | string | null: false                         |
| prefecture | integer | null: false                         |
| city    | string | null: false                             |
| address | string | null: false                             |
| apartment | string |
### Association

- belongs_to: user



