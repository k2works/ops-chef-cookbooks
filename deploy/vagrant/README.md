#  開発用仮想マシン構築手順

## 目的
一貫した開発環境をVMで維持構築する

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| vagrant         | 1.8.4        |             |
| chef-dk        | 0.14.25      |             |
| vagrant-berkshelf  | 4.1.0    |             |
| vagrant-omnibus    | 1.4.1    |             |
| vagrant-chef-zero  | 2.0.0    |             |
| vagrant-s3auth     | 1.3.0    |             |
| sahara         | 0.0.17       |             |

## 構成
+ プロビジョニング
+ 追加作業
+ リリース

## 詳細
### Vagrantのインストール
https://www.vagrantup.com/

### Chef-dkのインストール
https://downloads.chef.io/chef-dk/

### Vagrantセットアップ
```
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-chef-zero
$ vagrant plugin install vagrant-s3auth
$ vagrant plugin install sahara
```

### プロビジョニング
```
$ vagrant up
$ vagrant provision
```

### 追加作業
1. プロビジョニングイメージを保存する
```
$ vagrant sandbox on
$ vagrant sandbox commit
```

### リリース
```
$ ./create_box.sh
$ cd ./box/add_box.sh
```

### 備考
リリース初回時に`vagrant plugin install vagrant-exec`でプラグインを追加する。
共有フォルダのマウントに失敗する場合は`vagrant plugin install vagrant-vbguest`でプラグインを追加する。

開発用マシンのソフトウェア構成の詳細はクックブックの[README](../../README.md)参照

## 参照
+ [Vagrant と Chef による仮想環境構築の自動化（VirtualBox編）](https://www.ogis-ri.co.jp/otc/hiroba/technical/vagrant-chef/chap1.html)
