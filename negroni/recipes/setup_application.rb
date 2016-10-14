app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"
db = search(:aws_opsworks_rds_db_instance).first
ruby_version = node['ruby']['version']

ruby_runtime app do
  provider :ruby_build
  version ruby_version
end

application app_path do
  ruby ruby_version

  environment.update("PORT" => "80")
  environment.update(app["environment"])

  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end

  bundle_install do
    deployment true
    without %w{development test}
  end

  rails do
    database app["data_sources"]["database_name"]
    secret_token 'd78fe08df56c9'
    migrate true
  end

  unicorn do
    port 8000
  end
end
