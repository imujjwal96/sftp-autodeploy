# sftp-autodeploy
### Travis Configuration


    sudo: required

    before_script:
    - sudo apt-get install build-essential debhelper libssh2-1-dev
    - sudo apt-get source libcurl3
    - sudo apt-get build-dep libcurl3
    - sudo add-apt-repository -y ppa:git-ftp/ppa
    - sudo apt-get update
    - sudo apt-get install git-ftp 

    script:
    - source <(curl -s https://raw.githubusercontent.com/imujjwal96/sftp-autodeploy/master/init.sh)
