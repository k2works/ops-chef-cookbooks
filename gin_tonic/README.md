# gin_tonic

## 目的

クックブックの作成・テスト・デプロイのサンプルレシピ

## 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| ubuntu   　　　| 16.04       |             |
| centos   　　　| 7.2       |             |

## 構成
+ セットアップ
+ ローカル実行
+ レシピの作成と実行
+ テストの実行
+ デプロイ

### セットアップ
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/gin_tonic
$ chef gem install kitchen-docker -v 2.5.0
$ kitchen converge
```
仮想マシンOSがUbuntu14.4の場合は[dockerのストレージドライバーをdevicemapperに変更する＠Ubuntu 14.04](http://www.mazn.net/blog/2015/12/13/1545.html)をあらかじめ実施しておく

### ローカル実行
MOTDファイルを作成する

```
$ chef-client --local-mode hello.rb
$ more /tmp/motd 
```

再度実行する
```
$ chef-client --local-mode hello.rb
```

MOTDファイルの内容を更新する

`hello.rb`
```
file '/tmp/motd' do
  content 'hello chef'
end
```

```
$ chef-client --local-mode hello.rb
```

MOTDファイルが他の方法で更新されないか確認する

```
$ echo 'hello robots' > /tmp/motd
$ chef-client --local-mode hello.rb
```

MOTDファイルを削除する

```
$ chef-client --local-mode goodbye.rb
$ more /tmp/motd
```

### レシピの作成と実行

クックブックの作成

```
$ cd /vagrant
$ chef generate cookbook gin_tonic
```

テンプレートの作成

```
$ chef generate template gin_tonic index.html
```

作成したテンプレートを編集する

```
<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>
```

レシピを作成する

`gin_tonic/reipes/default.rb`

```
# Install the Apache package.
package_name =
    service_name =
        case node['platform']
          when 'centos' then 'httpd'
          when 'ubuntu' then 'apache2'
        end

# Install the package.
package package_name

# Start and enable the service.
service service_name do
  action [:enable, :start]
end

# Serve a custom home page.
file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end
```

クックブックを実行する

```
$ cd /vagrant/gin_tonic
$ kitchen converge
```

クックブックを作成したコンテナにログインして動作を確認する
```
$ cd /vagrant/gin_tonic
$ kitchen list
Instance             Driver  Provisioner  Verifier  Transport  Last Action
default-ubuntu-1604  Docker  ChefZero     Inspec    Ssh        Converged
default-centos-72    Docker  ChefZero     Inspec    Ssh        Created
$ kitchen login ubuntu
$$$$$$ Running legacy login for 'Docker' Driver
kitchen@localhost's password: kitchen
$ curl localhost
 <html>
 <body>
 <h1>hello world</h1>
 </body>
 </html>
$ exit
```

### テストの実行

InSpecテストを作成する

`gin_tonic/test/recipes/defalult_test.rb`


InSpecテストを実行する
```
$ kitchen verify ubuntu
```

ChefSpecテストを作成する
`gin_tonic/spec/unit/recipes/default_spec.rb`

ChefSpecテストを実行する
```
$ chef exec rspec --color spec/unit/recipes/default_spec.rb 
```

### デプロイ
クックブックをパッケージする
```
$ cd /vagrant/gin_tonic/
$ berks package gin_tonic.tar.gz
$ mv gin_tonic.tar.gz ../deploy/vm
```

パッケージしたクックブックを展開して仮想マシンイメージをプロビジョニングする
```
$ cd /vagrant/deploy/vm
$ tar xvf gin_tonic.tar.gz
$ rm gin_tonic.tar.gz 
```

開発用マシンからログアウトして仮想マシンのプロビジョニングを実行する
```
$ exit
$ cd deploy/vm/
$ vagrant up
$ chmod 755 create_box.sh 
$ ./create_box.sh 
$ cd box/
$ ./add_box.sh 
```

## 参照
+ [Welcome to the Learn Chef tutorials](https://learn.chef.io/tutorials/)
+ [Ubuntu上のdocker build で error: unpacking of archive failed on file /usr/sbin/suexec: cpio: cap_set_file](http://qiita.com/kaakaa_hoe/items/602f0cef1fa50ebdcbfc)

