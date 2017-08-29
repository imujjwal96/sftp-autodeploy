#!/bin/bash
#
# Automates the deployment of Github Repositories.
# Synchronizes development and production instances of a Project.
#
# Environment Variables:
# $FTP_USER - FTP Username
# $FTP_PASSWORD - FTP Password
# $FTP_URL - URL with the directory location
#            (eg. sftp://example.com/var/www/)

export LOC=$(pwd)

cd ..
wget https://www.libssh2.org/download/libssh2-1.8.0.tar.gz >/dev/null 2>&1
tar -zxvf libssh2-1.8.0.tar.gz >/dev/null 2>&1
cd libssh2-1.8.0/
./configure >/dev/null 2>&1
make >/dev/null 2>&1
sudo make install >/dev/null 2>&1

cd ..
wget https://curl.haxx.se/download/curl-7.54.0.tar.gz >/dev/null 2>&1
tar -zxvf curl-7.54.0.tar.gz >/dev/null 2>&1
cd curl-7.54.0
./configure --with-libssh2=/usr/local >/dev/null 2>&1
make >/dev/null 2>&1
sudo make install >/dev/null 2>&1

cd /usr/lib/x86_64-linux-gnu/
sudo mv /usr/lib/x86_64-linux-gnu/libcurl.so.4 libcurl.so.4.bak
sudo cp /usr/local/lib/libcurl.so.4 .
sudo cp /usr/local/lib/libcurl.so.4.4.0 .

cd $LOC

git config git-ftp.url $FTP_URL
git config git-ftp.user $FTP_USER
git config git-ftp.password $FTP_PASSWORD

if ! git ftp push ; then
  git ftp init
fi

