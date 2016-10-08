# # encoding: utf-8

# Inspec test for recipe gin_and_bitters::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe package 'git' do
  it { should be_installed }
end

describe package 'curl' do
  it { should be_installed }
end

describe package 'chef' do
  it { should be_installed }
end

describe package 'ruby' do
  it { should be_installed }
end

describe command 'ruby -v' do
  its('stdout') { should match /1.9.3/ }
end

describe package 'python' do
  it { should be_installed }
end

describe file('/usr/local/bin/aws') do
  it { should be_file }
end

describe file('/usr/local/bin/terraform') do
  it { should be_file }
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

describe file('/var/lib/jenkins') do
  it { should be_directory }
end

