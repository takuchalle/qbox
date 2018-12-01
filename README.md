[![CircleCI](https://circleci.com/gh/takuyaohashi/qbox/tree/master.svg?style=svg)](https://circleci.com/gh/takuyaohashi/qbox/tree/master)

# Q box

自分だけの匿名質問サービス。

[Peing](https://peing.net)や[Sarahah](https://www.sarahah.com/)のようにユーザ登録して使うのではなく、自分専用の質問を受けられるサービスです。a

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

まずクローンします。

```
$ git clone https://github.com/takuyaohashi/qbox.git
```

heroku のプロジェクトを作成します。

```
$ heroku create
```

heroku の環境変数に AWS の S3 の情報をセットします。

```
$ heroku config:set S3_REGION=[あなたのリージョン名]
$ heroku config:set S3_BUCKET=[あなたのバケット名]
$ heroku config:set S3_ACCESS_KEY=[あなたのアクセスキー]
$ heroku config:set S3_SECRET_KEY=[あなたのシークレットキー]
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
