# negroni

## 目的
OpwWorks用Railsアプリケーション

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| Ubuntu         | 14.04        |             |
| Ubuntu         | 16.04        |             |
| Ruby           | 2.3.0        |             |

## 構成
+ セットアップ
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/negroni/
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

### デプロイ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/negroni/
```

