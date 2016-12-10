app = search(:aws_opsworks_app).first
ruby_version = node['ruby']['version']

ruby_runtime app do
  provider :ruby_build
  version ruby_version
end
