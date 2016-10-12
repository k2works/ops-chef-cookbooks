# manhattan

## 目的
Rubyアプリケーション環境構築用仮想マシン

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| Ubuntu         | 14.04        |             |
| Ruby           | 2.3.0        |             |
| MySQL          | 5.6          |             |
| PostgreSQL     | 9.3          |             |

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

