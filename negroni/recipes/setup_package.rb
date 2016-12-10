include_recipe 'apt::default'
include_recipe 'yum::default'
include_recipe 'git::default'
include_recipe 'curl::default'
include_recipe 'nodejs::default'

case node["platform"]
  when "amazon"
    packages = %w{
      ImageMagick
      sqlite-devel
      mysql-devel
      postgresql
      xorg-x11-server-Xvfb
      epel-release
    }
  when "redhat", "centos", "fedora"
    packages = %w{
      ImageMagick
      sqlite-devel
      postgresql
      xorg-x11-server-Xvfb
      epel-release
      qt5-qtwebkit-devel
    }
  else
    packages = %w{
      imagemagick
      sqlite3
      libmysqlclient-dev
      mysql-client
      postgresql-client
      xvfb
      qt5-default
      libqt5webkit5-dev
      gstreamer1.0-plugins-base
      gstreamer1.0-tools
      gstreamer1.0-x
    }
end

case node["platform"]
  when "redhat", "centos", "fedora", "amazon"
    packages.each do |package|
      package "#{package}" do
        action :install
      end
    end

    if platform_family?('rhel') && node['platform_version'].to_i == 7 then
      remove_packages = %w[
                           mariadb-libs
                          ]

      remove_packages.each do |pkg|
        service pkg do
          action [:disable, :stop]
        end
      end

      remove_packages.each do |pkg|
        package pkg do
          action :remove
        end
      end

      rpm= 'mysql-community-release-el7-5.noarch.rpm'
      baseurl = 'http://dev.mysql.com/get'
      remote_file "/usr/local/src/#{rpm}" do
        not_if "ls /usr/local/src/#{rpm}"
        source "#{baseurl}/#{rpm}"
      end

      mysql_packeges = %w[
                           mysql-community-common
                           mysql-community-libs
                           mysql-community-client
                           mysql-community-devel
                          ]

      mysql_packeges.each do |pkg|
        package pkg do
          action :install
          source "/usr/local/src/#{rpm}"
          provider Chef::Provider::Package::Rpm
        end
      end

      package 'mysql-devel' do
        action :install
      end
    else
      package 'mysql-devel' do
        action :install
      end
    end
  else
    packages.each do |package|
      package "#{package}" do
        action :install
      end
    end
end
