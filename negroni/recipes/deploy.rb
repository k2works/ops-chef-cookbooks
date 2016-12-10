app = search(:aws_opsworks_app).first
db = search(:aws_opsworks_rds_db_instance).first
app_path = "/srv/#{app['shortname']}"
ruby_version = node['ruby']['version']

application app_path do
  ruby ruby_version

  git app_path do
    repository app['app_source']['url']
    revision app['app_source']['revision']
  end

  bundle_install do
    deployment true
    without %w{development test}
  end

  rails do
    database app['data_sources']['database_name']
    secret_token node['rails']['secret_token']
    migrate true
  end

  unicorn do
    port node['unicorn']['port']
  end
end
