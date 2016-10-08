docker_service 'default' do
  action [:create, :start]
end

bash "install docker-compose" do
  code <<-EOC
    curl -L https://github.com/docker/compose/releases/download/#{node['docker-compose']['version']}/docker-compose-`uname -s`-`uname -m` > /usr/local/docker-compose-#{node['docker-compose']['version']} && \
    ln -s /usr/local/docker-compose-#{node['docker-compose']['version']} /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
  EOC
  not_if {File.exists?("/usr/local/docker-compose-#{node['docker-compose']['version']}")}
end

bash "install docker-machine" do
  code <<-EOC
    curl -L https://github.com/docker/machine/releases/download/v#{node['docker-machine']['version']}/docker-machine-`uname -s`-`uname -m` > /usr/local/docker-machine-#{node['docker-machine']['version']} && \
    ln -s /usr/local/docker-machine-#{node['docker-machine']['version']} /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine
  EOC
  not_if {File.exists?("/usr/local/docker-machine-#{node['docker-machine']['version']}")}
end

if node['etc']['passwd']['vagrant']
  group 'docker' do
    action [:modify]
    members ['vagrant']
    append true
  end
end

gem_package 'kitchen-docker' do
  gem_binary "/opt/chefdk/embedded/bin/gem"
  version '2.5.0'
  action :install
end
