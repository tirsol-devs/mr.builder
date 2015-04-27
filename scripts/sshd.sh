#!/bin/bash

apt-get -y install openssh-server

# Old school, we do not need that for internal connects
echo "UseDNS no" >> /etc/ssh/sshd_config

# Speed up SSH, we can enable if we need that
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
