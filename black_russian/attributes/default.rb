default['ruby-env']['user'] = "vagrant"
default['ruby-env']['group'] = "vagrant"
default['java']['jdk_version'] = '8'
default['mysql']['server_root_password'] = "password"
default['mysql']['version'] = '5.7'
default['postgresql']['version'] = '9.5'
default['postgresql']['config']['listen_addresses'] = '*'
default['postgresql']['config']['port'] = 5432
default['postgresql']['password']['postgres'] = 'password'
default['postgresql']['server']['config_change_notify'] = :reload
default['postgresql']['pg_hba'] = [
    {:comment => '# Optional comment', :type => 'host', :db => 'all', :user => 'all', :addr => '10.0.2.2/32', :method => 'md5'},
    {:comment => '# Optional comment', :type => 'host', :db => 'all', :user => 'all', :addr => '127.0.0.1/32', :method => 'md5'}
]
