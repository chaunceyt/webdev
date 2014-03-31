#!/bin/bash

PACKAGE=puppetlabs-release-precise.deb

cd /tmp
wget https://apt.puppetlabs.com/$PACKAGE
sudo dpkg -i $PACKAGE
sudo apt-get update
sudo apt-get install -y puppet
rm $PACKAGE
