app = search(:aws_opsworks_app).first
app_root_dir = "#{node['app']['deploy_to']}/#{app['shortname']}"
bundle_path = "/opt/ruby_build/builds/#{node['ruby']['version']}/bin"
env = app['environment']['RAILS_ENV']

case node["platform"]
  when "debian", "ubuntu"
    template "delayed-job" do
      path "/etc/systemd/system/delayed-job.service"
      source "delayed-job.service.erb"
      owner "root"
      group "root"
      mode 0751
    end
  when "redhat", "centos", "fedora"
    if platform_family?('rhel') && node['platform_version'].to_i == 7 then
      template "delayed-job" do
        path "/etc/systemd/system/delayed-job.service"
        source "delayed-job.service.erb"
        owner "root"
        group "root"
        mode 0751
      end
    elsif platform_family?('rhel') && node['platform_version'].to_i == 6 then
      template "delayed-job" do
        path "/etc/init.d/delayed-job"
        source "delayed-job.erb"
        owner "root"
        group "root"
        mode 0751
        variables(
            :app_root_dir => app_root_dir,
            :bundle_path => bundle_path,
            :env => env
        )
      end

      file "#{app_root_dir}/script/delayed_job" do
        mode 0744
        only_if { File.exists?("#{app_root_dir}/script/delayed_job") }
      end
    end
  when "amazon"
    template "delayed-job" do
      path "/etc/init.d/delayed-job"
      source "delayed-job.erb"
      owner "root"
      group "root"
      mode 0751
      variables(
          :app_root_dir => app_root_dir,
          :bundle_path => bundle_path,
          :env => env
      )
    end
end