# VCCW Environment for Theme Build

[VCCW](http://vccw.cc/)で構築されたWordPressテーマ制作のためのスターターキットです。  
詳しい解説については、[ブログの紹介記事](http://littlebird.mobi/2017/07/vccw_git2/)も合わせてお読みください。

## 仕様

このリポジトリには以下のツールおよび設定が全て含まれています。

- WordPress
- [_s](http://underscores.me/)（スターターテーマ）
- テーマユニットテストデータ
- テーマ開発に役立つプラグイン集
- マルチサイト設定（日英2言語）

## インストール

### 1. VirtualBoxのインストール

https://www.virtualbox.org/

### 2. Vagrantのインストール

http://www.vagrantup.com/

### 3. vagrant-hostsupdaterプラグインのインストール（任意）

```
$ vagrant plugin install vagrant-hostsupdater
```

### 4. Vagrantのboxファイルのダウンロード

```
$ vagrant box add vccw-team/xenial64
```

### 5. リポジトリのクローンと仮想環境の構築

```
git clone https://github.com/littlebirdjp/vccw-env-for-theme-build.git ~/prj/vccw-env-for-theme-build
cd ~/prj/vccw-env-for-theme-build
vagrant up
```

`/prj/`フォルダはご自身でお使いの環境に適宜置き換えてください。

### 6. ブラウザでローカルのWordPressを確認

[http://vccw.local/](http://vccw.local/) または [http://192.168.33.99/](http://192.168.33.99/) にアクセスしてください。

## 使い方

この環境をGitに保存することで、複数メンバー間でテーマ制作等の作業内容を共有していくことができます。

`wordpress.sql`に変更が入った場合（リモートリポジトリからプルしたファイルに差分があった場合）は、以下のコマンドを実行してください。

```
vagrant ssh
wp db import /vagrant/wordpress.sql
exit
```

WordPressの設定や投稿などのデータに変更を加えた場合は、以下のコマンドを実行してから、`wordpress.sql`もコミット＆プッシュしてください。

```
vagrant ssh
wp db export /vagrant/wordpress.sql
exit
```

※テーマやプラグイン等のファイルを編集した場合は、通常通りコミット＆プッシュを行なってください。

## カスタマイズ

サイト固有の設定項目のみ`site.yml`に記述してあります。  
ドメインを変更したり、追加でプラグインやテーマをインストールする等、オプションを追加・変更したい場合は、こちらのファイルを編集してください。

```
hostname: vccw.local
ip: 192.168.33.99
multisite: true
plugins:
  - wp-total-hacks
  - tinymce-templates
  - theme-check
  - wordpress-importer
linked_clone: true
```

### グローバル設定

VCCWで複数の環境を構築していて、それらのサイト共通で使いたいデフォルト項目がある場合は、`~/.vccw~/config.yml`に設定ファイルを設置し、そちらにオプションを記述してください。

### 使える変数一覧

オプションで使用できる全ての変数は、 `provision/default.yml`に記述されているので、そちらを参考にしてください。
