default['app']['deploy_to'] = '/srv'
default['ruby']['version'] = '2.1.10'
default['unicorn']['port'] = '8000'
default['nginx']['rack_upstream']['server'] = 'localhost:8000'
default['nginx']['proxy']['send_timeout']= '3000'
default['nginx']['proxy']['read_timeout']= '3000'
default['nginx']['proxy']['max_body_size']= '100M'
default['rails']['secret_token'] = 'd78fe08df56c9'