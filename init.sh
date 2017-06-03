#!/bin/bash
#
# Automates the deployment of Github Repositories.
# Synchronizes development and production instances of a Project.
#
# Environment Variables:
# $FTP_USER
# $FTP_PASSWORD
# $FTP_URL
#

# before_deploy
# sudo apt-get install git-ftp

git config git-ftp.url $FTP_URL
git config git-ftp.user $FTP_USER
git config git-ftp.password $FTP_PASSWORD

if ! git ftp push ; then
  git ftp init
fi

