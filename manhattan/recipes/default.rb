#
# Cookbook Name:: manhattan
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'manhattan::setup'
include_recipe 'manhattan::setup_ruby-env'
include_recipe 'manhattan::setup_mysql-env'
include_recipe 'manhattan::setup_postgres-env'
include_recipe 'manhattan::setup_redis-env'
include_recipe 'manhattan::setup_mongodb-env'
include_recipe 'manhattan::configure'
include_recipe 'gin_and_bitters::setup_docker-env'
include_recipe 'gin_and_bitters::setup_aws-env'
include_recipe 'gin_and_bitters::setup_heroku-env'
include_recipe 'gin_and_bitters::setup_jenkins-env'
include_recipe 'martini::setup_application'
include_recipe 'martini::setup_yarn'