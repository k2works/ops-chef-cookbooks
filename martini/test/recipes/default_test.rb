# # encoding: utf-8

# Inspec test for recipe martini::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

%w[
v0.12.16
v4.6.0
v6.7.0
].each do |dir|
  describe directory("/usr/local/src/nvm/versions/node/#{dir}/") do
    it { should be_directory }
  end
end
