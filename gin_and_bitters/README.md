# gin_and_bitters

## 目的
インフラ環境構構築作業用仮想マシン

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| docker         | 17.04.0      |             |
| docker-compose | 1.8.0        |             |
| docker-machine | 0.10.0       |             |
| aws-cli        | 1.11.81      |             |
| eb             | 3.10.1       |             |
| chef-dk        | 1.3.43       |             |
| vagrant        | 1.8.5        |             |
| packer         | 0.10.1       |             |
| terraform      | 0.6.16       |             |
| python         | 2.7.12       |             |
| jenkins        |              |             |

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

