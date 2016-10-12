# ops-chef-cookbooks

## 目的
アプリケーション・インフラ開発者が  
開発用仮想マシン環境で各種Chefクックブックの作成・テスト・デプロイをできるようにする  
なぜなら統一された動作環境を共有することで生産性を高めることができるから

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| vagrant   　　　| 1.8.4       |             |
| packer    　　　| 0.8.6       |             |

## 構成

+ [GinTonic](./gin_tonic)・・・教育用レシピ
+ [Gin&Bitters](./gin_and_bitters)・・・インフラ環境構築作業用
+ [Martini](./martini)・・・モダンWebアプリケーション環境構築用(Node.js)
+ [Manhattan](./manhattan)・・・Rubyアプリケーション環境構築用

## 公開サービス

+ [Atlas](https://atlas.hashicorp.com/hiroshima-arc)

## Tips
#### `berks package`で`encode': "\xC3" on US-ASCII (Encoding::InvalidByteSequenceError)`が出たら。
```
$ export LC_ALL=en_US.UTF-8
$ export LANG=en_US.UTF-8
$ berks package
```
+ [How can I fix ERROR: “\xC3” on US-ASCII when bootstrapping chef-client?](http://stackoverflow.com/questions/24962828/how-can-i-fix-error-xc3-on-us-ascii-when-bootstrapping-chef-client)

#### Ubuntu 14.04でSSHログイン時のメッセージをカスタマイズ
+ [Ubuntu 14.04でSSHログイン時のメッセージをカスタマイズ](https://mistymagich.wordpress.com/2015/07/17/ubuntu-14-04%E3%81%A7ssh%E3%83%AD%E3%82%B0%E3%82%A4%E3%83%B3%E6%99%82%E3%81%AE%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%82%92%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA/)
