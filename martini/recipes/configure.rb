if node['etc']['passwd']['vagrant']
  user = 'vagrant'
  group = 'vagrant'
else
  user = 'kitchen'
  group = 'kitchen'
end

template '/etc/update-motd.d/98-server-info' do
  source 'server-info.erb'
  mode '0755'
end

template '/etc/update-motd.d/99-banner' do
  source 'banner.erb'
  mode '0755'
end

bash "Update MOTD" do
  code "chmod 766 /run/motd.dynamic"
  code "run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic"
end

template ".bash_profile" do
  source ".bash_profile.erb"
  path "/home/#{user}/.bash_profile"
  mode 0644
  owner user
  group group
end

bash "Update MOTD" do
  code "run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic"
end
