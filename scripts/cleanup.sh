#!/bin/bash

# Clean up
apt-get -y --purge remove linux-headers-$(uname -r) build-essential
apt-get -y --purge autoremove
apt-get -y purge $(dpkg --list |grep '^rc' |awk '{print $2}')
apt-get -y purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{ print $2}')
apt-get -y clean

# Remove history file
unset HISTFILE
rm ~/.bash_history /home/vagrant/.bash_history

# Clean dhcp leases
if [ -d "/var/lib/dhcp" ]; then
        # Remove leftover leases and persistent rules
        rm /var/lib/dhcp/*
fi

# Cleaning udev rules
#rm /etc/udev/rules.d/70-persistent-net.rules
#mkdir /etc/udev/rules.d/70-persistent-net.rules
#rm -rf /dev/.udev/
#rm /lib/udev/rules.d/75-persistent-net-generator.rules

# Adding a 2 sec delay to the interface up, to make the dhclient happy
echo "pre-up sleep 2" >> /etc/network/interfaces

# Cleanin /tmp
rm -rf /tmp/*

# Cleaning logs
find /var/log -type f -exec /bin/cp /dev/null {} \;

# sync data to disk (fix packer)
sync
