template "delayed-job" do
  path "/etc/init/delayed-job.conf"
  source "delayed-job.conf.erb"
  owner "root"
  group "root"
  mode 0751
end

bash "start delayed-job" do
  code <<-EOC
    initctl start delayed-job
  EOC
end
