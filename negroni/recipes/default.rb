#
# Cookbook Name:: negroni
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'git::default'
include_recipe 'curl::default'
include_recipe 'nodejs::default'

%w{
  imagemagick
  sqlite3
  libmysqlclient-dev
  mysql-client
  postgresql-client
  xvfb
  libqt4-dev
  libqtwebkit-dev
}.each do |package|
  package "#{package}" do
    action :install
  end
end

app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"
db = search(:aws_opsworks_rds_db_instance).first
ruby_version = node['ruby']['version']

ruby_runtime app do
  provider :ruby_build
  version ruby_version
end

application app_path do
  ruby ruby_version

  environment.update("PORT" => "80")
  environment.update(app["environment"])

  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end

  bundle_install do
    deployment true
    without %w{development test}
  end

  rails do
    database app["data_sources"]["database_name"]
    secret_token 'd78fe08df56c9'
    migrate true
  end

  unicorn do
    port 8000
  end
end

include_recipe 'chef_nginx::default'
