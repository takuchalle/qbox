[![CircleCI](https://circleci.com/gh/takuyaohashi/qbox/tree/master.svg?style=svg)](https://circleci.com/gh/takuyaohashi/qbox/tree/master)

# Q box

自分だけの匿名質問サービス。

[Peing](https://peing.net)や[Sarahah](https://www.sarahah.com/)のようにユーザ登録して使うのではなく、自分専用の質問を受けられるサービスです。

## 特徴

- 簡単に Heroku にデプロイ可能
- Twitter Card 対応
- サイトや Twitter Card の画像を自分でカスタマイズ可能

# 使い方
## 前提

次の項目が完了していることを前提にしています。

- heroku のアカウント登録済み
- heroku コマンドライン導入済み
- AWS の S3 のバケット作成済み

## デプロイ方法

まずクローンして、gem をインストールします。

```
$ git clone https://github.com/takuyaohashi/qbox.git
$ cd qbox
$ bundle install
```

heroku のプロジェクトを作成します。

```
$ heroku create
```

AWS のアクセスキーなど秘匿情報を登録します。

```
$ bundle exec rails credentials:edit
```

上記コマンドを打つとエディタが開きますので、次の情報を入力します。

```
aws:                                                                                                                                                                            access_key_id: [あなたの S3 のアクセスキー]
   secret_access_key: [あなたの S3 のシークレットキー]
   region: [あなたの S3 のリージョン]
   bucket: [あなたの S3 のバケット名]
```

暗号化された`/config/credentials.yml.enc`が生成されます。

エラーが出る場合、下記の順で試してください。

 - /config/credentials.yml.enc を削除する
 - export EDITOR=vim を実行する

heroku の環境変数にマスターキーの情報をセットします。

```
$ heroku config:set RAILS_MASTER_KEY=[config/master.keyに書かれている値]
```

wkhtmltoimage を使うので buildpacks を追加します。

```
$ heroku buildpacks:add https://github.com/takuyaohashi/heroku-buildpack-wkhtmltopdf.git
```

heroku にプッシュします。

```
$ git push heroku master
```

ここまでできたらサイトにアクセスできるか確認してください。

## 管理者登録

管理者の登録をするために`/admin/register`にアクセスして、名前とパスワードを設定してください。名前はサイト内で表示されます。日本語でも構いません。

今後は`/admin/login`からログインが可能になります。

# デモサイト

[デモサイト](https://polar-shore-44843.herokuapp.com/)を heroku に設置しているので使ってみてください。

無料枠を使っているので、しばらくアクセスがない場合はコンテナの起動から行うので時間がかかる可能性があります。

# Commit Symbol

|Symbol  |Meaning  |
|---|---|
|:muscle:| Add new feature |
|:white_check_mark:| Add test |
|:bug:| Fix bugs |
|:closed_book:| Update database |
|:lipstick:| Clean codes |
|:see_no_evil:| Ignore files |
|:gem:| Add/Remove gems |
|:memo:| Update document |
|:wrench:| Improve Environment |

# TODO

- [ ] ブラウザを閉じるとログアウトされるので、ログインセッションの改善

# License

[MIT](https://github.com/takuyaohashi/qbox/blob/master/LICENSE) @takuyaohashi
