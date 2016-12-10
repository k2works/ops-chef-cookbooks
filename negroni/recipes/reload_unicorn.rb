app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

application app_path do
  unicorn do
    action :reload
  end
end
