include_recipe 'nvm'
versions = %w[
v0.12.16
v4.6.0
v6.7.0
v6.9.2
v7.3.0
]

if node['etc']['passwd']['kitchen']
  versions.each do |ver|
    nvm_install ver  do
      user 'kitchen'
      group 'kitchen'
      from_source false
      from_source false
      alias_as_default true
      action :create
    end
  end
else
  versions.each do |ver|
    nvm_install ver  do
      user 'vagrant'
      group 'vagrant'
      from_source false
      from_source false
      alias_as_default true
      action :create
    end
  end
end
