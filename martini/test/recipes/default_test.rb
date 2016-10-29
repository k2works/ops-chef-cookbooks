# # encoding: utf-8

# Inspec test for recipe martini::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

%w[
v0.12.16
v4.6.0
v6.7.0
].each do |dir|
  describe directory("/home/kitchen/.nvm/versions/node/#{dir}/") do
    it { should be_directory }
  end
end

describe package 'git' do
  it { should be_installed }
end

describe package 'curl' do
  it { should be_installed }
end

describe package 'ruby' do
  it { should be_installed }
end

describe package 'python' do
  it { should be_installed }
end

describe file('/usr/local/bin/aws') do
  it { should be_file }
end

describe file('/usr/local/bin/eb') do
  it { should be_file }
end

# Dockerコンテナだとうまくいかない
describe service 'docker' do
  it { should be_enabled }
  it { should be_running }
end

describe port 2375 do
  it { should be_listening }
end

describe file('/usr/local/bin/docker-compose') do
  it { should be_file }
end

describe file('/usr/local/bin/docker-machine') do
  it { should be_file }
end

describe file('/usr/local/heroku/bin/heroku') do
  it { should be_file }
end

# Dockerコンテナだとうまくいかない
describe service 'jenkins' do
  it { should be_enabled }
  it { should be_running }
end

describe port 8080 do
  it { should be_listening }
end

describe command 'cat /etc/group | grep docker' do
  its('stdout') { should match /docker:x:999:kitchen/ }
end

describe file('/var/lib/jenkins') do
  it { should be_directory }
end

describe file('/home/kitchen/.bash_profile') do
  it { should be_file }
end

describe file('/etc/update-motd.d/98-server-info') do
  it { should be_file }
end

describe file('/etc/update-motd.d/99-banner') do
  it { should be_file }
end


