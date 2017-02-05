if node['etc']['passwd']['vagrant']
  user = 'vagrant'
  group = 'vagrant'
else
  user = 'kitchen'
  group = 'kitchen'
end

template '/etc/update-motd.d/98-server-info' do
  source 'server-info.erb'
  mode '0755'
end

template '/etc/update-motd.d/99-banner' do
  source 'banner.erb'
  mode '0755'
end

bash "Update MOTD" do
  code "chmod 766 /run/motd.dynamic"
  code "run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic"
end

template ".bash_profile" do
  source ".bash_profile.erb"
  path "/home/#{user}/.bash_profile"
  mode 0644
  owner user
  group group
end

bash "Update MOTD" do
  code "run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic"
end

# MySQL
# mysql -h0.0.0.0 -uroot -ppassword
# GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
# flush privileges;
mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {:host => "127.0.0.1",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database_user 'root' do
  connection mysql_connection_info
  host '%'
  password node['mysql']['server_root_password']
  action :grant
end