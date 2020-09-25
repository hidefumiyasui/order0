# アプリケーション概要

## アプリケーション名
>order0 (オーダーゼロ)

## アプリケーション概要
>飲食店で注文から決済までをスマートフォンでできるシステムです。テーブルにあるQRコードをスマホで読み取りスマートフォンでメニューを確認し注文する。
>テーブル番号とメニューのデータが厨房に飛び注文が完了。食べ終わるとスマートフォンに登録した決済方法で決済が完了する。

## URL


## テスト用アカウント


## 利用方法
- お店側
    - システムにログイン。ホームページの編集ができる。メニューの登録、編集ができる。お客様が注文したメニューとテーブル番号をキッチンで受け取れる。
    - 配膳すると注文したメニューを完了にすることができ確認できる。お客様が食事後決済を完了しているか確認できる。
- お客様側
    - テーブルにあるQRコードを読み取りホームページに遷移。ユーザー情報の登録またはログインできる。メニュー一覧でメニューを見れ。
    - 注文したメニューをカート機能に追加できる。選択が完了したらカート機能で注文したい内容の個数等を確認し、注文確定できる。
    - 追加で注文したい場合は別に追加できる。注文した内容が配膳されるまでの流れをスマートフォンで確認できる。
    - 注文した内容を最後にスマートフォンに登録した決済方法(クレジットカード等)で決済できる。

## 目指した課題解決
- お店側
    - 飲食店の人材不足の問題を改善。注文と決済をお客様にしてもらいホールスタッフの仕事を減らす。注文時、会計時にお客様を待たせないためお客様満足度が上がる。
    - 新型コロナウイルス感染対策として注文をとる際の感染リスク、会計時の感染リスクを減らせる。
    - キャッシュレス化による現金の管理がなくなる。注文の承りの間違いがなくなる。
- お客様側
    - 注文時、会計時にスタッフがいなくて待つ時間がなくなる。余計なやりとりを減らせ新型コロナウイルス対策になる。
    - スマートフォンがあれば決済ができるため財布を待たなくていい。注文時や会計時に喋らなくていい。

## 洗い出した要件
  - ユーザー管理機能
  - クレジットカードによる決済機能
  - カート機能
  - 注文機能
  - 決済機能
  - 商品一覧機能
  - 商品登録編集機能

## 実装した機能についてのGIFと説明


## 実装予定の機能
  - 商品カテゴリー機能
  - 商品ランキング機能
  - 商品いいね機能
  - 商品コメント機能
  - 領収書発行機能
  - ユーザーポイント機能
  - 商品お気に入り登録機能

## データベース設計


## ローカルでの動作方法





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