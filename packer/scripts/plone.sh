#!/bin/bash -eux

# Install dependecies for Plone [https://plone.org]
apt-get -y install htop python2.7 build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev zlib1g-dev python-dev libjpeg62-dev libreadline-gplv2-dev python-imaging wv poppler-utils python-psutil python-support git vim libz-dev

# Download Installer
su -c "wget --no-check-certificate https://launchpad.net/plone/4.3/4.3.4/+download/Plone-4.3.4-UnifiedInstaller.tgz" vagrant

# Unpack Installer
su -c "tar -xf Plone-4.3.4-UnifiedInstaller.tgz" vagrant

# Run Installer
su -c "./Plone-4.3.4-UnifiedInstaller/install.sh --password=plone standalone" vagrant

# Delete old files
rm -rf Plone-4.3.4-UnifiedInstaller.tgz
rm -rf Plone-4.3.4-UnifiedInstaller

