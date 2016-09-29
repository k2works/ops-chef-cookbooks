#
# Cookbook Name:: martini
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'nvm'

%w[
v0.12.16
v4.6.0
v6.7.0
].each do |ver|
  nvm_install ver  do
    from_source false
    alias_as_default true
    action :create
  end
end

nvm_alias_default '6.7.0'  do
  action :create
end
