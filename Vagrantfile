# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.10.10.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "TTPS-Ruby-Aparicio"

    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  user = 'vagrant'
  home = "/home/#{user}"
  rbenv_path = "#{home}/.rbenv"
  profile_path = "#{home}/.bashrc"
  ruby_version = '2.3.0'
  rbenv_abs_path = "#{rbenv_path}/bin/rbenv"
  gem_abs_path = "#{rbenv_path}/shims/gem"
  app_name = "sistema-informes"
  app_path = "#{home}/application"
  app_shared_path = "#{app_path}/shared"
  upstart_path = "/etc/init/#{app_name}"

  database_name = "informes_gastro"
  database_username = "root"
  database_password = "naty20"

  secret_key_base = "32a2c7298e68642ab7f60aed34fa96e2376b7dc8bc3197c5f1d870adc618a9e64747cba73327551a3b5ec75ea113ee3d9405cd06b18bac209b8b78bea9ba22d6"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y git autoconf bison build-essential lib{ssl,yaml,sqlite3}-dev libreadline6{,-dev} zlib1g{,-dev}
    if [ ! -d #{rbenv_path} ]; then
      git clone https://github.com/sstephenson/rbenv.git #{rbenv_path}
      git clone https://github.com/sstephenson/ruby-build.git #{rbenv_path}/plugins/ruby-build
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{profile_path}
      echo 'eval "$(rbenv init -)"' >> #{profile_path}
    else
      cd #{rbenv_path} && git pull origin master
      cd #{rbenv_path}/plugins/ruby-build && git pull origin master
    fi
    chown -R #{user}:#{user} #{rbenv_path}
    sudo -i -H -u #{user} /bin/bash -lc '#{rbenv_abs_path} install -s #{ruby_version} && #{rbenv_abs_path} global #{ruby_version} && #{gem_abs_path} update --system && #{gem_abs_path} install bundler'

    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password #{database_password}'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password #{database_password}'
    sudo apt-get install -y mysql-server libmysqlclient-dev nodejs

    if ! mysql -uroot -p#{database_password} -e 'use #{database_name}'; then
      mysqladmin -p#{database_password} create #{database_name}
    fi
    mkdir -p #{app_shared_path}/config
    sudo chown -R #{user} #{app_path}
    sudo mkdir -p #{upstart_path}
    sudo chown -R #{user} #{upstart_path}

    cat > #{app_shared_path}/config/database.yml << YML
production:
  adapter: mysql2
  encoding: utf8
  pool: 10
  database: #{database_name}
  username: #{database_username}
  password: #{database_password}
  socket: /var/run/mysqld/mysqld.sock
YML

    cat > #{app_shared_path}/.env << ENV
SECRET_KEY_BASE="#{secret_key_base}"
RAILS_ENV=production
HOME=/home/vagrant
PATH=/home/vagrant/.rbenv/shims:/home/vagrant/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV
  SHELL
end
