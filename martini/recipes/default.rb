#
# Cookbook Name:: martini
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'martini::setup_application'
include_recipe 'gin_and_bitters::setup_docker-env'
include_recipe 'gin_and_bitters::setup_aws-env'
include_recipe 'gin_and_bitters::setup_heroku-env'
include_recipe 'gin_and_bitters::setup_jenkins-env'
include_recipe 'martini::configure'
