# manhattan

## 目的
Rubyアプリケーション環境構築用仮想マシン

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| Ruby           | 2.4.1        |             |
| MySQL          | 5.7          |             |
| PostgreSQL     | 9.5          |             |
| Redis          | 3.0.6        |             |
| Mongodb        | 2.6.10       |             |
| node           | 7.9.0      |             |
| npm            | 4.2.0      |             |
| yarn           | 0.23.2     |             |
| python         | 2.7.12       |             |
| jenkins        | 2.55         |             |
| aws-cli        | 1.11.76      |             |
| EB CLI         | 3.10.1       |             |
| heroku-toolbelt|              |             |
| heroku-cli     |              |             |
| chef-dk        |              |             |
| vagrant        |              |             |


## 構成
+ セットアップ
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/manhattan/
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

### デプロイ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/manhattan
$ ./setup_deploy_vm_cookbooks.sh 
$ exit
$ cd deploy/vm/
$ vagrant up --provision
$ ./create_box.sh
$ cd box/manhattan
$ ./add_box.sh
```

## 参照
+ [redis](https://supermarket.chef.io/cookbooks/redis)
+ [mongodb](https://supermarket.chef.io/cookbooks/mongodb#readme)

