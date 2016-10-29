name 'martini'
maintainer 'Hiroshima ARC'
maintainer_email 'hiroshima.arc@gmail.com'
license 'all_rights'
description 'Installs/Configures martini'
long_description 'Installs/Configures martini'
version '0.2.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/martini/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/martini' if respond_to?(:source_url)
depends 'apt', '~> 2.6.1'
depends 'git', '~> 5.0.1'
depends 'nodejs', '~> 2.4.4'
depends 'nvm', '~> 0.1.7'
depends 'poise-ruby', '~> 2.2.0'
depends 'heroku', '~> 0.1.0'
depends 'awscli', '~> 1.1.2'
depends 'gin_and_bitters'
