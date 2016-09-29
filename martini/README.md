# martini

## 目的
モダンWebアプリケーション環境構築用(Node.js)レシピ

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| node           | 6.7.0      |             |

## 構成
+ セットアップ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

## 参照
+ [nodejs](https://supermarket.chef.io/cookbooks/nodejs)
+ [nvm](https://supermarket.chef.io/cookbooks/nvm)

