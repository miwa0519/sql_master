# SQL 超マスター

## 環境

- Docker for Mac 2.3.0.3（Windows は Windows 版を入れる）
- Ruby 2.6.6
- Rails 6.0.3
- MySQL 8.0
- DBeaver 7.1.0

## 環境構築

1. リポジトリを clone する
2. `$ docker-compose build`を実行
3. `$ docker-compose up -d`を実行
4. `$ docker-compose exec web rails db:create` を実行
5. `$ docker-compose exec web rails db:migrate`を実行
6. `$ docker-compose exec web rails db:seed` を実行
7. [こちら](https://qiita.com/niki_cat_0714/items/d137db55c2f73ea65791)の記事を参考に、`MySQL`と`DBeaver`を接続する
8. `DBeaver` との接続後、`students` テーブルにレコードが 6 件登録されていることを確認できれば OK

※DBeaber との接続時、MySQL の `root` パスワードを要求されると思います。パスワードは `docker-compose.yml`の`MYSQL_ROOT_PASSWORD` に指定されている値を入力してください。
