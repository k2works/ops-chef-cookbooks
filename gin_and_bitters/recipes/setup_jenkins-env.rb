include_recipe 'jenkins::master'

# For Jenkins
user "jnekins" do
  password "$1$NK7CEczt$84diJRinF934T6F/ytIGy1" # openssl passwd -1 'jenkins'
  supports :manage_home => true
  action :create
end

if node['etc']['passwd']['vagrant']
  %w[vagrant docker].each do |gr|
    group gr do
      action [:modify]
      members ["jenkins"]
      append true
    end
  end
end

