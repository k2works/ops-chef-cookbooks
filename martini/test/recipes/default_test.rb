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

describe package 'ruby' do
  it { should be_installed }
end

describe command 'ruby -v' do
  its('stdout') { should match /1.9.3/ }
end

describe file('/usr/local/heroku/bin/heroku') do
  it { should be_file }
end

describe file('/usr/local/bin/aws') do
  it { should be_file }
end

describe file('/usr/local/bin/eb') do
  it { should be_file }
end

describe file('/etc/update-motd.d/98-server-info') do
  it { should be_file }
end

describe file('/etc/update-motd.d/99-banner') do
  it { should be_file }
end



