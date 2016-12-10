%w{
  imagemagick
  sqlite3
  libmysqlclient-dev
  mysql-client
  postgresql-client
  xvfb
  libqt4-dev
  libqtwebkit-dev
}.each do |package|
  package "#{package}" do
    action :install
  end
end
