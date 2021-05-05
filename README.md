## users テーブル

| Column | Type | Options |
| ---------- | -------- | -------- |
| image    | carrierwave | null: false |
| name | string | null: false |
| nickname | string | null: false|
| self_introduction | text | null: false|

- has_many :photos
- has_many :comments
- has_many :photos, through: :comments

## photos テーブル

| Column | Type | Options |
| ---------- | -------- | -------- |
| title      | string | null: false |
| image    | ActiveStorage | ------- |
| area_id | integer | null: false |
| description | text | null: false|
| user | references | null: false  |

- belongs_to :user
- has_many : comments
- has_many : users, through: :comments



## commentsテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| text      | text | null: false |
| user | references | null: false |
| photo |  references  | -------- | 

- belongs_to :user
- belongs_to :photo

## likeテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| user_id | references | null: false |
| picture_book_id |  references  | null: false | 


- belongs_to :users
- belongs_to :photos