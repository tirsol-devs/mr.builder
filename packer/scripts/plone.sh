#!/bin/bash -eux

# Install dependecies for Plone [https://plone.org]
apt-get install htop build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev zlib1g-dev python-setuptools python-dev libjpeg62-dev libreadline-gplv2-dev python-imaging wv poppler-utils python-psutil python-support git vim libz-dev

# Download Installer
wget --no-check-certificate https://launchpad.net/plone/4.3/4.3.4/+download/Plone-4.3.4-UnifiedInstaller.tgz

# Unpack Installer
tar -xf Plone-4.3.4-UnifiedInstaller.tgz

# Run Installer
./Plone-4.3.4-UnifiedInstaller/install.sh --password=plone standalone

# Delete old files
rm -rf Plone-4.3.4-UnifiedInstaller.tgz


