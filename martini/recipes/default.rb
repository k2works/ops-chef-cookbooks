#
# Cookbook Name:: martini
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'martini::setup_application'
include_recipe 'martini::setup_deploy_tools'
include_recipe 'martini::configure'
