#!/bin/bash
set -e
CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_URL="https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/packer" ]; then
  wget -O /tmp/packer.zip "${PACKER_URL}"
  unzip -d "${CIRCLECI_CACHE_DIR}" /tmp/packer.zip
fi

packer version

# Install vbox
#echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" > virtualbox.list
#sudo mv virtualbox.list /etc/apt/sources.list.d/
#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
#sudo apt-get autoremove
sudo apt-get install -y linux-lowlatency build-essential dkms
#sudo apt-get install -y virtualbox-4.3
#sudo /etc/init.d/vboxdrv setup
sudo apt-get install -y virtualbox virtualbox-dkms virtualbox-guest-utils virtualbox-guest-additions-iso virtualbox-ose-dkms 
