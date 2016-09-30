template '/etc/update-motd.d/98-server-info' do
  source 'server-info.erb'
  mode '0755'
end

template '/etc/update-motd.d/99-banner' do
  source 'banner.erb'
  mode '0755'
end

bash "Update MOTD" do
  code "run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic"
end
