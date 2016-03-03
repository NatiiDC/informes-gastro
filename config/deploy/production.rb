set :default_environment, { 'PATH' => '/home/vagrant/.rbenv/shims:/home/vagrant/.rbenv/bin:$PATH' }

ip_from_vagrantfile = File.read('Vagrantfile').scan(/ip: ["']([\d\.]+)["']/).flatten.first
vagrant_private_key = '.vagrant/machines/default/virtualbox/private_key'

server ip_from_vagrantfile, user: 'vagrant', roles: %w{app db web}
set :deploy_to, '/home/vagrant/application'

set :ssh_options, { keys: [vagrant_private_key] }
