mysql_service 'default' do
  port '3306'
  version node['mysql']['version']
  initial_root_password node['mysql']['server_root_password']
  action [:create, :start]
end
