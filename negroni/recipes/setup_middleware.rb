include_recipe 'chef_nginx::default'

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  mode '0644'
end

template '/etc/nginx/conf.d/default.conf' do
  source 'nginx.default.conf.erb'
  mode '0644'

  variables({
                :server => node['nginx']['rack_upstream']['server']
            })
end
