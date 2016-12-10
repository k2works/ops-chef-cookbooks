app = search(:aws_opsworks_app).first
db = search(:aws_opsworks_rds_db_instance).first
app_path = "/srv/#{app['shortname']}"
ruby_version = node['ruby']['version']

case db['engine']
  when 'mysql'
    db_adapter = 'mysql2'
  when 'postgresql'
    db_adapter = 'postgresql'
  else
    db_adapter = 'sqlite3'
end

application app_path do
  ruby ruby_version

  git app_path do
    repository app['app_source']['url']
    revision app['app_source']['revision']
    ssh_wrapper '/root/.ssh/git_wrapper.sh'
  end

  bundle_install do
    deployment true
    without %w{development test}
  end

  rails do
    database({
      adapter: db_adapter,
      username: db['db_user'],
      host: db['address'],
      database: app['data_sources'][0]['database_name'],
      password: db['db_password'],
    })
    secret_token node['rails']['secret_token']
    migrate true
    precompile_assets true
  end

  unicorn do
    port node['unicorn']['port']
  end
end
