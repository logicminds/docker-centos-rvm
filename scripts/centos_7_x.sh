#!/usr/bin/env bash

set -e
yum install -y kernel-devel gcc-c++ kernel-headers make gcc wget git hostname tar gzip unzip > /dev/null
yum install -y which dmidecode hwdata libselinux-utils net-tools pciutils pciutils-libs virt-what zlib-devel
yum -y group install 'Development tools'

REPO_URL="http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# for selinux ruby versions
echo "[rhel-7-server-optional-rpms]
name = Red Hat Enterprise Linux 7 Server - Optional (RPMs)
baseurl = http://mirror.centos.org/centos/7/os/x86_64/
enabled = 1
gpgcheck = 0" >/etc/yum.repos.d/centos7_optional.repo

useradd runner 
