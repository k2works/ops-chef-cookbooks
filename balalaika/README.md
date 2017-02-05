# balalaika

## 目的
.Netアプリケーション環境構築用レシピ

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| dotnetcore     | 1.0.0      |             |
| node           | 7.3.0      |             |
| npm            | 3.10.10    |             |
| yarn           | 0.18.1     |             |
| ruby           | 2.3.1      |             |
| python         | 2.7.12     |             |
| aws-cli        | 1.11.36    |           |
| EB CLI         | 3.9.0      |             |
| heroku-toolbelt|       |             |
| heroku-cli     |       |             |

## 構成
+ セットアップ
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/black_russian/
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

### デプロイ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/black_russian/
$ ./setup_deploy_vm_cookbooks.sh 
$ exit
$ cd deploy/vm/
$ vagrant up --provision
$ ./create_box.sh
$ cd box/balck_russian
$ ./add_box.sh
```