ruby_runtime 'myapp' do
  case node["platform"]
    when "ubuntu"
      case node['platform_version']
        when '14.04'
          version '1.9.3'
        when '16.04'
          version '2.3'
      end
    else
      version '1.9.3'
  end

  options dev_package: false
end

include_recipe 'heroku'
