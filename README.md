# テーブル設計


## users テーブル

| Column      | Type     | Options     |
| ---------   | -------- | --------    |
| nickname    | string   | null: false |
| email       | string   | null: false |
| password    | string   | null: false |
| family_name | string   | null: false |
| first_name  | string   | null: false |
| birthday    | date     | null: false |


### Association

- has_one :carts
- has_many :creditcards
- has_many :payments


## creditcards テーブル

| Column      | Type       | Options                        |
| ---------   | --------   | --------                       |
| user        | references | null: false, foreign_key: true |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |


### Association
- belongs_to :user


## items テーブル

| Column      | Type       | Options                        |
| --------    | --------   | ------------                   |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |
| genre       | references | null: false, foreign_key: true |


### Association

- belongs_to :genre
- has_one :items


## genre テーブル

| Column      | Type       | Options      |
| --------    | --------   | ------------ |
| name        | string     | null: false  |


### Association
- has_many :items


## carts テーブル

| Column   | Type       | Options                        |
| -------- | --------   | ------------                   |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |


## Association

- belongs_to :user
- belongs_to :item
- has_one :order


## order テーブル

| Column    | Type       | Options                        |
| --------  | --------   | ------------                   |
| cart      | references | null: false, foreign_key: true |


## Association

- belongs_to :order
- has_one :payment