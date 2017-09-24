
server '13.112.86.245', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hiratakoya/.ssh/id_rsa'
