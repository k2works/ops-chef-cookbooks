case node["platform"]
  when "ubuntu"
    case node['platform_version']
      when '14.04'
        include_recipe 'emacs24'
      when '16.04'
        package "emacs24-nox" do
          action :install
        end
    end
end
