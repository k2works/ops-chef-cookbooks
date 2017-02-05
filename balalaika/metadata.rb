name 'balalaika'
maintainer 'Hiroshima ARC'
maintainer_email 'hiroshima.arc@gmail.com'
license 'all_rights'
description 'Installs/Configures martini'
long_description 'Installs/Configures martini'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/martini/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/martini' if respond_to?(:source_url) #
depends 'apt', '~> 2.9.2'
depends 'git', '~> 5.0.1'
depends 'dotnetcore', '~> 1.1.2'
depends 'java', '~> 1.45.0'
depends 'gradle', '~> 1.5.1'
depends 'poise-ruby', '~> 2.2.0'
depends 'heroku', '~> 0.1.0'
depends 'awscli', '~> 1.1.2'
depends 'mysql',  '~> 8.2.0'
depends 'mysql2_chef_gem', '~> 1.1.0'
depends 'database', '~> 5.1.2'
depends 'postgresql', '~> 6.0.1'
depends 'build-essential', '~> 7.0.1'
depends 'gin_and_bitters'
depends 'martini'