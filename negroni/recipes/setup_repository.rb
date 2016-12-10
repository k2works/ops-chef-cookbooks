app = search(:aws_opsworks_app).first
git_key = app['app_source']['ssh_key']

directory "/root/.ssh" do
  action :create
  mode   "700"
end

# Create known_hosts
file "/root/.ssh/known_hosts" do
  owner "root"
  mode "0755"
end

# Add github key
execute "generate ssh skys for GitHub." do
  command "ssh-keyscan github.com >> /root/.ssh/known_hosts"
end

# Add bitbuckets key
execute "generate ssh skys for BitBackets." do
  command "ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts"
end

file "/root/.ssh/git_wrapper.sh" do
  owner "root"
  mode "0755"
  content "#!/bin/sh\nexec /usr/bin/ssh -i /root/.ssh/id_rsa \"$@\""
end

file "/root/.ssh/id_rsa" do
  mode "0600"
  content git_key
end