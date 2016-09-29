# ops-chef-cookbooks

## 目的
アプリケーション・インフラ開発者が  
開発用仮想マシン環境で各種Chefクックブックの作成・テスト・デプロイをできるようにする  
なぜなら統一された動作環境を共有することで生産性を高めることができるから

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| vagrant   　　　| 1.8.4       |             |

## 構成

+ [GinTonic](./gin_tonic)・・・教育用レシピ
+ [Martini](./martini)・・・モダンWebアプリケーション環境構築用(Node.js)

## Tips
#### `berks package`で`encode': "\xC3" on US-ASCII (Encoding::InvalidByteSequenceError)`が出たら。
```
$ export LC_ALL=en_US.UTF-8
$ export LANG=en_US.UTF-8
$ berks package
```
+ [How can I fix ERROR: “\xC3” on US-ASCII when bootstrapping chef-client?](http://stackoverflow.com/questions/24962828/how-can-i-fix-error-xc3-on-us-ascii-when-bootstrapping-chef-client)

