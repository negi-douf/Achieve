
server '52.199.230.182', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hiratakoya/.ssh/id_rsa'
