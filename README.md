Introduction
======

A framework for learning packer, Vagrant, and hiera based puppet.

This repo contains configuration that uses packer to build a basic
Ubuntu 12.04 virtualbox image with puppet installed. A Vagrantfile
exists for launching the built virtualbox image and hiera based Puppet
is used to finish installing packages make it suitable for doing
PHP 5.4 based web development by adding Apache, PHP and MySQL.

Usage
======
* Change to packer directory and execute `packer build packer.json` to build a virtualbox image
* From base directory, run `bundle install` to get puppet and librarian-puppet gems which are used to pull down contributed puppet modules
* From puppet directory, run `bundle exec librarian-puppet install --verbose` to install contributed puppet modules
* Vagrant file is set so that the document root of the web server on the VM will be the contents of an html directory in the base directory of the repo. At minimum create this directory but the intention is that the code for your development will live here (or be linked to from here)
* From base directory of repo, run `vagrant up`
* The mysql root password is auto generated and can be found in /root/.my.cnf, use `sudo mysql` to connect as root.

Customizing
======

There are several levels of customizations available. To change what
is added to the virtualbox image created you can add a script to the
directory packer/scripts and trigger it as a provisioner in packer.json

To change what happens to the vm after launching with Vagrant you can
modify puppet/hiera.yaml and puppet/hiera to control classess added and
configurations. The file puppet/Puppetfile can be used to add new
contributed puppet modules to the puppet/modules directory. The 
directory puppet/custom is where custom modules should be added. The
Vagrantfile sets up /etc/puppet/modules to point at puppet/custom via
a shared directory and puppet/modules is included via the puppet
provisioner.
