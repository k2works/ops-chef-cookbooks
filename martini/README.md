# martini

## 目的
モダンWebアプリケーション環境構築用(Node.js)レシピ

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| node           | 7.9.0      |             |
| npm            | 4.2.2      |             |
| yarn           | 0.23.2     |             |
| Mongodb        | 2.6.10       |             |
| ruby           | 2.3.1      |             |
| python         | 2.7.12     |             |
| aws-cli        | 1.11.76    |           |
| EB CLI         | 3.10.1     |             |
| heroku-toolbelt|       |             |
| heroku-cli     |       |             |

## 構成
+ セットアップ
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/martini/
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

### デプロイ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/martini/
$ ./setup_deploy_vm_cookbooks.sh 
$ exit
$ cd deploy/vm/
$ vagrant up --provision
$ ./create_box.sh
$ cd box/martini
$ ./add_box.sh
```

## 参照
+ [nodejs](https://supermarket.chef.io/cookbooks/nodejs)
+ [nvm](https://supermarket.chef.io/cookbooks/nvm)

