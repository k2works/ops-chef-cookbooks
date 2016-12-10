case node["platform"]
  when "debian", "ubuntu"
    service "delayed-job" do
      action :restart
    end
  when "redhat", "centos", "fedora", "amazon"
    if platform_family?('rhel') && node['platform_version'].to_i == 7 then
      service "delayed-job" do
        action :restart
      end
    elsif platform_family?('rhel') && node['platform_version'].to_i == 6 then
      service "delayed-job" do
        action :reload
      end
    end
end

