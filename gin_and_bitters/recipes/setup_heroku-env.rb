ruby_runtime 'myapp' do
  version '1.9.3'
  options dev_package: false
end
include_recipe 'heroku'
