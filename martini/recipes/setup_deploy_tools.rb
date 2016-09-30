ruby_runtime 'myapp' do
  version '1.9.3'
  options dev_package: false
end
include_recipe 'heroku'

include_recipe 'awscli'
python_pip "awsebcli"
python_pip "--upgrade awsebcli"
