# # encoding: utf-8

# Inspec test for recipe negroni::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

%w[git curl nodejs nginx].each do |pkg|
  describe package pkg do
    it { should be_installed }
  end
end

describe service 'nginx' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl localhost' do
  its('stdout') { should match /The page you were looking for doesn't exist/ }
end

describe port 80 do
  it { should be_listening }
end

describe service 'myapp' do
  it { should be_enabled }
  it { should be_running }
end

describe port 8000 do
  it { should be_listening }
end

describe service 'delayed-job' do
  it { should be_enabled }
  it { should_not be_running }
end

describe file('/etc/update-motd.d/98-server-info') do
  it { should be_file }
end

describe file('/etc/update-motd.d/99-banner') do
  it { should be_file }
end

describe file('/etc/update-motd.d/98-server-info') do
  it { should be_file }
end