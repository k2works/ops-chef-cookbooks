#https://yarnpkg.com/

execute 'get package' do
  command 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -'
end

execute 'set package' do
  command 'echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list'
end

execute 'install package' do
  command 'sudo apt-get update && sudo apt-get install yarn -y'
end