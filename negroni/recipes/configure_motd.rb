case node["platform"]
  when "redhat", "centos", "fedora", "amazon"

  else
    template '/etc/update-motd.d/98-server-info' do
      source 'server-info.erb'
      mode '0755'
    end

    template '/etc/update-motd.d/99-banner' do
      source 'banner.erb'
      mode '0755'
    end

    bash 'Update MOTD' do
      code 'chmod 766 /run/motd.dynamic'
      code 'run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic'
    end
end
