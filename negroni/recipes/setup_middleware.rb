include_recipe 'chef_nginx::default'

template '/etc/nginx/conf.d/default.conf' do
  source 'nginx.default.conf.erb'
  mode '0644'

  variables({
                :server => node['nginx']['rack_upstream']['server']
            })
end

template '/etc/nginx/conf.d/proxy.conf' do
  source 'nginx.proxy.conf.erb'
  mode '0644'

  variables({
                :proxy_send_timeout => node['nginx']['proxy']['send_timeout'],
                :proxy_read_timeout => node['nginx']['proxy']['read_timeout'],
                :proxy_client_max_body_size => node['nginx']['proxy']['max_body_size']
            })
end
