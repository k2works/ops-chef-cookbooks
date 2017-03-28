default['ruby-env']['user'] = "vagrant"
default['ruby-env']['group'] = "vagrant"
default['ruby-env']['versions'] = ["2.3.1","2.4.1"]
default['ruby-env']['default'] = "2.4.1"
default['ruby-env']['rbenv_url'] = "https://github.com/sstephenson/rbenv.git"
default['ruby-env']['ruby-build_url'] = "https://github.com/sstephenson/ruby-build.git"
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
