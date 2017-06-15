# gin_and_bitters

## 目的
インフラ環境構構築作業用仮想マシン

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| docker         | 17.05.0      |             |
| docker-compose | 1.8.0        |             |
| docker-machine | 0.10.0       |             |
| aws-cli        | 1.11.105     |             |
| eb             | 3.10.2       |             |
| chef-dk        | 1.4.3        |             |
| vagrant        | 1.8.5        |             |
| packer         | 0.10.1       |             |
| terraform      | 0.6.16       |             |
| python         | 2.7.12       |             |
| jenkins        |              |             |
| chef-server    |              |             |

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
+ [Vagrantで作った環境にChef12 でChef Serverをためしてみた](https://gist.github.com/kazu69/0efcc34d02f5443bf0a8)
+ [Chef Server 環境構築手順](http://qiita.com/kentarok/items/c487490d48621fb503cc)

