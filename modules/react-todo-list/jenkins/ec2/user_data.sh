#!/bin/bash
# redirect all error message below this line to /var/log/user_data_error.log 
exec 2>> /var/log/user_data_error.log  
echo -e ' \n start script' >> /var/log/user_data_error.log 
sudo yum update -y
sudo yum update -y
# install git and docker
sudo yum install -y git docker 
sudo curl -L https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-compose-plugin-2.6.0-3.el7.x86_64.rpm -o ./compose-plugin.rpm
sudo yum install ./compose-plugin.rpm -y
sudo service docker start
echo -e 'docker version: ' >> /var/log/user_data_error.log 
sudo docker --version >> /var/log/user_data_error.log 

echo -e 'docker compose version: ' >> /var/log/user_data_error.log
sudo docker compose version >> /var/log/user_data_error.log

# jenkins
mkdir jenkins jenkins_home

echo -e " \n end script "  >> /var/log/user_data_error.log 
