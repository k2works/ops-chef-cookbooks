%w{
  libssl-dev
  libreadline-dev
  libmysqlclient-dev
  libsqlite3-dev
  libxslt-dev
  libxml2-dev
  libqt4-dev
  libqtwebkit-dev
  xvfb
  ruby-dev
  imagemagick
  nodejs
  sqlite3
  postgresql-client
}.each do |pkg|
  package pkg do
    action :install
  end
end

if node['etc']['passwd']['vagrant']
  user = node['ruby-env']['user']
  group = node['ruby-env']['group']
else
  user = 'kitchen'
  group = 'kitchen'
end

git "/home/#{user}/.rbenv" do
  repository node["ruby-env"]["rbenv_url"]
  action :sync
  user user
  group group
end

directory "/home/#{user}/.rbenv/plugins" do
  owner user
  group group
  mode 0755
  action :create
end

git "/home/#{user}/.rbenv/plugins/ruby-build" do
  repository node["ruby-env"]["ruby-build_url"]
  action :sync
  user user
  group group
end

node['ruby-env']['versions'].each do |ver|
  execute "rbenv install #{ver}" do
    command "/home/#{user}/.rbenv/bin/rbenv install #{ver}"
    user user
    group group
    environment 'HOME' => "/home/#{user}"
    not_if { File.exists?("/home/#{group}/.rbenv/versions/#{ver}")}
  end
end

execute "rbenv global #{node['ruby-env']['default']}" do
  command "/home/#{user}/.rbenv/bin/rbenv global #{node['ruby-env']['default']}"
  user user
  group group
  environment 'HOME' => "/home/#{user}"
end

%w{rbenv-rehash bundler}.each do |gem|
  execute "gem install #{gem}" do
    command "/home/#{user}/.rbenv/shims/gem install #{gem}"
    user user
    group group
    environment 'HOME' => "/home/#{user}"
    not_if "/home/#{user}/.rbenv/shims/gem list | grep #{gem}"
  end
end
