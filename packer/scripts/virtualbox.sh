#!/bin/bash

VBOX_ISO=~/VBoxGuestAdditions.iso
sudo mount -o loop $VBOX_ISO /mnt
yes|sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt
cd /usr/lib
sudo find /opt -path '*/lib/VBoxGuestAdditions' -exec ln -s {} \;
rm $VBOX_ISO

