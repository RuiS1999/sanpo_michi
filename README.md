# さんぽ道

## サイトURL
URL:**http://43.206.117.52/**<br>
<br>

## サイト概要
散歩やサイクリングに行った際に気に入った風景や休憩場所、気になった食事処などを投稿でき、誰か共有することを目的としています。
投稿をお気に入り登録することで自分のお気に入りを誰かと共有することができ、誰かのお気に入りに足を運んだり純粋に投稿を楽しんだりすることもできます。<br>
また、歩数、散歩時間、消費カロリーを記録する日記としてもご利用いただけます。<br>
<br>

## サイトテーマ
* 散歩で見つけたお気に入りや気になったところの画像を共有するSNS<br>
* 歩数、散歩時間、消費カロリーを記録する日記としての役割もある<br>
<br>

## テーマを選んだ理由
気分転換のために散歩やサイクリングをよく行うのですが、その際に見つけたお気に入りの風景や休憩場所を誰かと共有できたらと思い製作に着手しました。<br>
<br>

## ターゲットユーザ
* ちょっとした発見や気分転換を目的に散歩やサイクリングをする方々に向けて。<br>
* 散歩やサイクリングのよさを知らない人に向けて。<br>
<br>

## 主な利用シーン
散歩やサイクリングに行った際に気に入った風景や休憩場所、気になった食事処などを投稿し同じ趣味の人たちと共有する目的で利用する。<br>
<br>

## 実装機能リストのURL
URL:**https://docs.google.com/spreadsheets/d/1UseO6dKvOUPhvxEOkqwHEwb9zWhOM0RfrtZ39PAqLa0/edit?usp=sharing**<br>
<br>

## 使用素材
* Font Awesome<br>
* ぱくたそ<br>
* O-DAN<br>
<br>

## 環境構築に必要な手順
```
$ git clone https://github.com/RuiS1999/sanpo_michi.git
$ cd sanpo_michi
$ bundle install --without production
$ yarn add jquery bootstrap@4.5 popper.js
$ rails db:migrate
$ rails db:seed
$ rails s
```

#### 管理者ユーザー
* 管理者ログイン 〜/admin/sign_in
* メールアドレス test@t.com
* パスワード　test123
<br>

#### テストユーザー
* メールアドレス test@t.com
* パスワード　test123