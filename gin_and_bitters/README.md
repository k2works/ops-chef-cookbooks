# gin_and_bitters

## 目的
インフラ環境構構築作業用仮想マシン

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| docker         | 1.11.2       |             |
| docker-compose | 1.8.0-rc1    |             |
| docker-machine | 1.7.2        |             |
| aws-cli        | 1.10.42      |             |
| eb             | 3.7.6        |             |
| chef-dk        | 0.15.15      |             |
| terraform      | 0.6.16       |             |
| python         | 2.7.6        |             |
| jenkins        |              |             |
| heroku-toolbelt|       |             |
| heroku-cli     |       |             |

## 構成
+ セットアップ
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/gin_and_bitters/
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
$ kitchen verify
```

### デプロイ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/gin_and_bitters/
$ ./setup_deploy_vm_cookbooks.sh 
$ exit
$ cd deploy/vm/
$ vagrant up --provision
$ ./create_box.sh
$ cd box/gin_and_bitters
$ ./add_box.sh
```

## 参照

